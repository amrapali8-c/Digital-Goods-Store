module MyModule::DigitalGoodsStore {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::string::String;
    use aptos_std::table::{Self, Table};
    
    /// Struct representing a digital good in the store.
    struct DigitalGood has store {
        name: String,         // Name of the digital good
        price: u64,          // Price in APT tokens
        seller: address,     // Address of the seller
        is_available: bool,  // Whether the item is still available
    }
    
    /// Store resource that holds all digital goods.
    struct Store has key {
        goods: Table<u64, DigitalGood>,  // Mapping from item_id to DigitalGood
        next_item_id: u64,               // Counter for generating unique item IDs
    }
    
    /// Function to list a new digital good in the store.
    public fun list_digital_good(
        seller: &signer, 
        name: String, 
        price: u64
    ) acquires Store {
        let seller_addr = signer::address_of(seller);
        
        // Create store if it doesn't exist
        if (!exists<Store>(@MyModule)) {
            let store = Store {
                goods: table::new(),
                next_item_id: 1,
            };
            move_to(seller, store);
        };
        
        let store = borrow_global_mut<Store>(@MyModule);
        let item_id = store.next_item_id;
        
        // Create the digital good
        let digital_good = DigitalGood {
            name,
            price,
            seller: seller_addr,
            is_available: true,
        };
        
        // Add to store and increment counter
        table::add(&mut store.goods, item_id, digital_good);
        store.next_item_id = item_id + 1;
    }
    
    /// Function to purchase a digital good.
    public fun purchase_digital_good(
        buyer: &signer, 
        item_id: u64
    ) acquires Store {
        let store = borrow_global_mut<Store>(@MyModule);
        let digital_good = table::borrow_mut(&mut store.goods, item_id);
        
        // Check if item is available
        assert!(digital_good.is_available, 1);
        
        // Transfer payment from buyer to seller
        let payment = coin::withdraw<AptosCoin>(buyer, digital_good.price);
        coin::deposit<AptosCoin>(digital_good.seller, payment);
        
        // Mark item as sold
        digital_good.is_available = false;
    }
}