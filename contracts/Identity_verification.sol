// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityVerification {
   
    struct Identity {
        string name;
        string dateOfBirth; 
        bool isVerified;
    }
    
    
    mapping(address => Identity) private identities;
    
    
    event IdentityRegistered(address indexed user, string name, string dateOfBirth);
    
    
    event IdentityVerified(address indexed user);
    
   
    function registerIdentity(string memory name, string memory dateOfBirth) public {
        
        require(bytes(identities[msg.sender].name).length == 0, "Identity already registered");
        
     
        require(validateDateFormat(dateOfBirth), "Invalid date format. Use DD/MM/YYYY");
        
       
        identities[msg.sender] = Identity(name, dateOfBirth, false);
        
      
        emit IdentityRegistered(msg.sender, name, dateOfBirth);
    }
    
 
    function verifyIdentity(address user) public {
        
        require(bytes(identities[user].name).length != 0, "Identity not found");
        
        
        require(!identities[user].isVerified, "Identity already verified");
        
     
        identities[user].isVerified = true;
        
        
        emit IdentityVerified(user);
    }
    
    
    function getIdentity(address user) public view returns (string memory name, string memory dateOfBirth, bool isVerified) {
        Identity memory identity = identities[user];
        return (identity.name, identity.dateOfBirth, identity.isVerified);
    }
    
  
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
