# IdentityVerification Smart Contract

## Vision
<img width="309" alt="image" src="https://github.com/user-attachments/assets/604d7994-56a8-4544-b268-13a848fa43d1">


The **IdentityVerification** smart contract aims to provide a decentralized and secure method for managing and verifying identities on the Educhain blockchain. By leveraging smart contracts, this system ensures that user identities are recorded immutably and can be verified transparently, which is essential for various digital interactions and services.

## Flowchart

+------------------------+
|  User Registers        |
|  Identity              |
+------------------------+
            |
            v
+------------------------+
|  Validate Date Format  |
|  (DD/MM/YYYY)          |
+------------------------+
            |
            v
+------------------------+
|  Store Identity        |
|  in Mapping            |
+------------------------+
            |
            v
+------------------------+
|  Emit Registration     |
|  Event                 |
+------------------------+
            |
            v
+------------------------+
|  User Requests         |
|  Verification          |
+------------------------+
            |
            v
+------------------------+
|  Verify Identity       |
+------------------------+
            |
            v
+------------------------+
|  Emit Verification     |
|  Event                 |
+------------------------+
            |
            v
+------------------------+
|  Retrieve Identity     |
|  Information           |
+------------------------+
## Contract Address: 0x2e7c58a05b67f38815ede8b23e432ab99df586b4
<img width="1458" alt="image" src="https://github.com/user-attachments/assets/69752f1c-6746-44cf-b594-e12b48e324bf">



## Features
- Register new identities with name and date of birth
- Verify registered identities
- Retrieve identity information
- Date of birth stored in "DD/MM/YYYY" format
- Basic date format validation

## Functions
1. registerIdentity(string name, string dateOfBirth)
2. verifyIdentity(address user)
3. getIdentity(address user)

## Events
- IdentityRegistered(address indexed user, string name, string dateOfBirth)
- IdentityVerified(address indexed user)

## Usage
1. Deploy the contract to an Ethereum network
2. Users call registerIdentity() to register their identity
3. Authorized entities call verifyIdentity() to verify identities
4. Anyone can call getIdentity() to retrieve identity information

## Security Considerations
- Implement access control for verifyIdentity()
- Consider privacy implications of storing personal data on-chain
- Enhance date validation for more robust checks

## Future Scope
1. Implement multi-factor authentication
2. Integrate with external identity verification services
3. Add support for identity updates and revocations
4. Implement a reputation system for verifiers
5. Explore zero-knowledge proofs for enhanced privacy
6. Develop a user-friendly frontend interface
7. Implement identity recovery mechanisms
8. Add support for multiple identity types (e.g., personal, corporate)
9. Explore integration with decentralized identity standards (e.g., DID)
10. Implement governance mechanisms for contract upgrades

## Developer Contact
Name: Sankar Das
Email: sankardas1627@gmail.com
GitHub: https://github.com/MrDas07
LinkedIn: https://www.linkedin.com/in/sankar-das-425715275
Instagram: https://www.instagram.com/mr_das_the_programmer/

## License
This project is licensed under the MIT License.

## Disclaimer
This smart contract is a prototype and not audited for production use. Use at your own risk.
