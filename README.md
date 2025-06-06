# BitCharity - Transparent Donation Management Platform

[![Stacks](https://img.shields.io/badge/Built%20on-Stacks-purple.svg)](https://stacks.co)
[![Bitcoin](https://img.shields.io/badge/Secured%20by-Bitcoin-orange.svg)](https://bitcoin.org)
[![Clarity](https://img.shields.io/badge/Language-Clarity-blue.svg)](https://clarity-lang.org)

A decentralized charity platform built on Bitcoin via Stacks Layer 2 that ensures complete transparency in donation collection and fund utilization through blockchain-based accountability mechanisms.

## 🌟 Overview

BitCharity revolutionizes charitable giving by providing an immutable, transparent platform where every donation and fund utilization is recorded on the blockchain. Built on Stacks Layer 2, it inherits Bitcoin's security while enabling smart contract functionality for automated charity management.

## ✨ Key Features

- **🔒 Transparent Operations**: All donations and expenditures recorded immutably on-chain
- **👥 Role-Based Governance**: Admin, Moderator, and Beneficiary access controls
- **🎯 Milestone-Based Fund Release**: Ensures proper fund utilization with approval workflows
- **💰 Secure Donations**: Direct STX transfers with automatic balance tracking
- **📊 Complete Audit Trail**: Every transaction permanently recorded and verifiable
- **🔐 Bitcoin Security**: Leverages Bitcoin's security through Stacks Layer 2 infrastructure

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    BitCharity Platform                      │
├─────────────────────────────────────────────────────────────┤
│  Frontend Layer                                             │
│  ├── Donor Interface (Donation Management)                  │
│  ├── Admin Dashboard (Platform Management)                  │
│  └── Public Transparency Portal (Audit Trail)               │
├─────────────────────────────────────────────────────────────┤
│  Smart Contract Layer (Clarity)                             │
│  ├── Role Management System                                 │
│  ├── Beneficiary Registry                                   │
│  ├── Donation Processing Engine                             │
│  └── Fund Utilization Tracker                               │
├─────────────────────────────────────────────────────────────┤
│  Stacks Layer 2 Blockchain                                  │
│  ├── Transaction Processing                                 │
│  ├── State Management                                       │
│  └── Smart Contract Execution                               │
├─────────────────────────────────────────────────────────────┤
│  Bitcoin Base Layer                                         │
│  └── Final Settlement & Security                            │
└─────────────────────────────────────────────────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) for local development
- [Stacks Wallet](https://wallet.hiro.so/) for testnet/mainnet deployment
- Node.js 16+ for frontend integration

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-org/bitcharity
   cd bitcharity
   ```

2. **Initialize Clarinet project**

   ```bash
   clarinet new bitcharity-project
   cd bitcharity-project
   ```

3. **Add the contract**

   ```bash
   # Copy the BitCharity contract to contracts/bitcharity.clar
   clarinet contract new bitcharity
   ```

4. **Run tests**

   ```bash
   clarinet test
   ```

### Deployment

#### Testnet Deployment

```bash
clarinet deploy --testnet
```

#### Mainnet Deployment

```bash
clarinet deploy --mainnet
```

## 📋 Usage

### Role Management

**Assign Roles** (Contract Owner Only)

```clarity
(contract-call? .bitcharity set-role 'SP1ABCD... u2) ;; Assign Moderator role
```

**Remove Roles** (Contract Owner Only)

```clarity
(contract-call? .bitcharity remove-role 'SP1ABCD...)
```

### Beneficiary Management

**Register Beneficiary** (Moderators+)

```clarity
(contract-call? .bitcharity register-beneficiary 
  "Local Food Bank" 
  "Supporting families in need with nutritious meals" 
  u50000000) ;; 50 STX target
```

**Get Beneficiary Info**

```clarity
(contract-call? .bitcharity get-beneficiary u1)
```

### Donation Process

**Make Donation**

```clarity
(contract-call? .bitcharity donate u1 u1000000) ;; Donate 1 STX to beneficiary #1
```

**Track Donations**

```clarity
(contract-call? .bitcharity get-donation-by-id u1)
(contract-call? .bitcharity get-donation-count)
```

### Fund Utilization

**Add Utilization Milestone** (Admins Only)

```clarity
(contract-call? .bitcharity add-utilization 
  u1 
  "Purchased 1000 meals for distribution" 
  u10000000) ;; 10 STX
```

**Approve Utilization** (Admins Only)

```clarity
(contract-call? .bitcharity approve-utilization u1 u1)
```

## 🔐 Security Features

- **Role-Based Access Control**: Hierarchical permissions system
- **Input Validation**: Comprehensive parameter checking
- **Reentrancy Protection**: Safe fund transfer mechanisms
- **Immutable Records**: All transactions permanently recorded
- **Bitcoin Settlement**: Final security through Bitcoin blockchain

## 🧪 Testing

Run the complete test suite:

```bash
clarinet test
```

Test specific functions:

```bash
clarinet console
```

## 📊 Error Codes

| Code | Constant | Description |
|------|----------|-------------|
| u100 | ERR-NOT-AUTHORIZED | Insufficient permissions |
| u101 | ERR-ALREADY-REGISTERED | Entity already exists |
| u102 | ERR-NOT-FOUND | Resource not found |
| u103 | ERR-INSUFFICIENT-FUNDS | Insufficient balance |
| u104 | ERR-BENEFICIARY-NOT-FOUND | Invalid beneficiary ID |
| u105 | ERR-UTILIZATION-NOT-FOUND | Invalid utilization ID |
| u106 | ERR-INVALID-INPUT | Invalid parameters |

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Write comprehensive tests for new features
- Follow Clarity best practices
- Ensure all security checks pass
- Update documentation for API changes

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏆 Roadmap

- **Phase 1**: Core contract deployment and testing
- **Phase 2**: Web interface and wallet integration
- **Phase 3**: Mobile app and advanced analytics
- **Phase 4**: Multi-chain support and DeFi integrations

---

### Built with ❤️ for transparent charity on Bitcoin
