// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityVerification {
    // Struct to represent a user's identity
    struct Identity {
        string name;
        string dateOfBirth; // Store as string in "DD/MM/YYYY" format
        bool isVerified;
    }
    
    // Mapping to store identities by user address
    mapping(address => Identity) private identities;
    
    // Event emitted when an identity is registered
    event IdentityRegistered(address indexed user, string name, string dateOfBirth);
    
    // Event emitted when an identity is verified
    event IdentityVerified(address indexed user);
    
    // Register a new identity
    function registerIdentity(string memory name, string memory dateOfBirth) public {
        // Ensure the identity is not already registered
        require(bytes(identities[msg.sender].name).length == 0, "Identity already registered");
        
        // Validate the date format (basic check)
        require(validateDateFormat(dateOfBirth), "Invalid date format. Use DD/MM/YYYY");
        
        // Register the identity
        identities[msg.sender] = Identity(name, dateOfBirth, false);
        
        // Emit the registration event
        emit IdentityRegistered(msg.sender, name, dateOfBirth);
    }
    
    // Verify an identity
    function verifyIdentity(address user) public {
        // Ensure the identity exists
        require(bytes(identities[user].name).length != 0, "Identity not found");
        
        // Ensure the identity is not already verified
        require(!identities[user].isVerified, "Identity already verified");
        
        // Verify the identity
        identities[user].isVerified = true;
        
        // Emit the verification event
        emit IdentityVerified(user);
    }
    
    // Get identity details
    function getIdentity(address user) public view returns (string memory name, string memory dateOfBirth, bool isVerified) {
        Identity memory identity = identities[user];
        return (identity.name, identity.dateOfBirth, identity.isVerified);
    }
    
    // Helper function to validate date format (basic check)
    function validateDateFormat(string memory date) private pure returns (bool) {
        bytes memory dateBytes = bytes(date);
        if (dateBytes.length != 10) return false;
        if (dateBytes[2] != '/' || dateBytes[5] != '/') return false;
        for (uint i = 0; i < 10; i++) {
            if (i != 2 && i != 5) {
                if (dateBytes[i] < '0' || dateBytes[i] > '9') return false;
            }
        }
        return true;
    }
}
