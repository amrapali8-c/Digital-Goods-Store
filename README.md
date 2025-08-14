# Digital Goods Store - Aptos Smart Contract

## Description

The Digital Goods Store is a decentralized marketplace smart contract built on the Aptos blockchain that enables users to buy and sell digital goods using APT tokens. This contract provides a secure, transparent, and efficient platform for digital commerce, allowing sellers to list their digital products and buyers to purchase them with automatic payment processing.

The contract features two core functions:
- **`list_digital_good`**: Allows sellers to list digital items with custom names, prices, and availability status
- **`purchase_digital_good`**: Enables buyers to purchase available digital goods with automatic APT token transfers

## Vision

Our vision is to create a thriving decentralized digital marketplace that empowers creators and consumers worldwide. We aim to:

- **Democratize Digital Commerce**: Remove barriers for creators to sell digital goods without intermediaries
- **Ensure Transparency**: Provide a blockchain-based solution where all transactions are transparent and verifiable
- **Enable Global Access**: Create a borderless marketplace accessible to anyone with an internet connection
- **Foster Innovation**: Support the growth of the digital economy through decentralized technologies
- **Build Trust**: Establish a secure platform where buyers and sellers can interact with confidence

## Future Scope

The Digital Goods Store smart contract is designed with extensibility in mind. Future enhancements may include:

### Phase 1 - Enhanced Functionality
- **Bulk Listing**: Allow sellers to list multiple items simultaneously
- **Inventory Management**: Support for quantity-based inventory tracking
- **Category System**: Implement product categories and search functionality
- **Price Updates**: Enable sellers to modify prices for unsold items

### Phase 2 - Advanced Features  
- **Royalty System**: Implement creator royalties for resales
- **Escrow Service**: Add dispute resolution and refund mechanisms
- **Multi-token Support**: Expand beyond APT to support other tokens
- **Reviews & Ratings**: Community-driven seller and product rating system

### Phase 3 - Platform Evolution
- **NFT Integration**: Support for unique digital assets and collectibles
- **Auction Mechanism**: Implement bidding functionality for premium items
- **Subscription Model**: Enable recurring digital services
- **API Integration**: Develop APIs for third-party platform integration
- **Mobile App**: Create dedicated mobile applications for better user experience

### Phase 4 - Ecosystem Expansion
- **Cross-chain Compatibility**: Expand to other blockchain networks
- **DAO Governance**: Implement community governance for platform decisions
- **Creator Tools**: Develop advanced tools for digital content creation
- **Analytics Dashboard**: Provide comprehensive sales and market analytics

## Contract Details

### Network Information
- **Blockchain**: Aptos
- **Network**: [Testnet/Mainnet - Update as appropriate]
- **Contract Address**: `[TO BE DEPLOYED]`
- **Module Name**: `MyModule::DigitalGoodsStore`

### Contract Functions
| Function | Description | Parameters |
|----------|-------------|------------|
| `list_digital_good` | List a new digital good for sale | `seller: &signer`, `name: String`, `price: u64` |
| `purchase_digital_good` | Purchase an available digital good | `buyer: &signer`, `item_id: u64` |

## Contract Details
**Deployed Contract Address:**
0xf86a09cde45c34f56106d6e4262a8db691faf3f59bea7041933cf37f5af140bb
<img width="1366" height="768" alt="2025-08-14" src="https://github.com/user-attachments/assets/b9138c17-4f6d-4606-ad2d-e54963169e43" />

### Data Structures
- **DigitalGood**: Stores item details (name, price, seller, availability)
- **Store**: Global resource containing all digital goods and ID counter

### Dependencies
- `aptos_framework::signer`
- `aptos_framework::coin`
- `aptos_framework::aptos_coin::AptosCoin`
- `std::string::String`
- `aptos_std::table`

### Deployment Instructions
```bash
# Compile the contract
aptos move compile

# Deploy to testnet
aptos move publish --profile testnet

# Deploy to mainnet (when ready)
aptos move publish --profile mainnet
```

### Usage Example
```bash
# List a digital good
aptos move run --function-id 0x[ADDRESS]::DigitalGoodsStore::list_digital_good --args string:"My Digital Art" u64:1000000

# Purchase a digital good (item_id = 1)
aptos move run --function-id 0x[ADDRESS]::DigitalGoodsStore::purchase_digital_good --args u64:1
```

---

**Built with ❤️ on Aptos Blockchain**

For support and contributions, please visit our [GitHub repository](https://github.com/amrapali8-c/Digital-Goods-Store)
