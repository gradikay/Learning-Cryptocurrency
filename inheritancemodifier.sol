// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// We have two contracts interacting with one another

// contract for the owner functionality
contract Owned {
    
    // Address variable ~ owner
    address owner;
    
    // Creat variable and assigning value loaded once
    constructor() {
        
        // Important variables
        // Creator of the contract
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        
        // All functions calling the modifier will now include
        // the require statment.
        // if statment : Checking that it is the owner handling the token
        require(msg.sender == owner, "You are not allowed");
        
        // the ~ "_" (underscore) ~ copies all the codes from the function being modified 
        _;
    }
    
}

// "MyContract" contract is extending "Owned" contract
contract MyContract is Owned {
    
    // Mapping variable ~ tokenBalance
    mapping(address => uint) public tokenBalance;
    
    
    // Unassigned Integer variable ~ tokenPrice ~ is equal to 1 ether
    uint tokenPrice = 1 ether;
    
    // Creat variable and assigning value loaded once
    constructor() {
        
        // Starting balance is 100 token
        tokenBalance[owner] = 100;
    }
    
    // Function creating new token - only the owner of the contract
    // including the modifier after "public"
    function creatNewToken() public onlyOwner {
        
        // if statment : Checking that it is the owner creating the token
        // require(msg.sender == owner, "You are not allowed"); // Now this statment 
        // comes from modifier.
        
        // Increament token Balance by 1
        tokenBalance[owner]++;
    }
    
    // Function burning / deleting token - only the owner of the contract
    function burnToken() public onlyOwner {
        
        // if statment : Checking that it is the owner burning the token
        // require(msg.sender == owner, "You are not allowed"); // Now this statment 
        // comes from modifier.
        
        // Decreament token Balance by 1
        tokenBalance[owner]--;
    }
    
    // Function purchasing tokens
    function purchaseToken() public payable {
        
        // if statment : Checking that we are sending more than 0 token
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "Not enough token");
        
        // Return token sent from owner
        tokenBalance[owner] -= msg.value / tokenPrice;
        
        // Return token received from sender
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    
    function sendToken(address _to, uint _amount) public {
        
        // if statment : Checking that the owner has enough Tokens
        require(tokenBalance[msg.sender] >= _amount, "Not enough token");
        
        // if statment : 
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        
        // Reduce token argument: Decrease balance by the amount sent
        // displays amount received after deduction
        tokenBalance[msg.sender] -= _amount;
        
        // Transfer field: Transfer amount
        // _to.transfer(_amount); // this is available only to address payable
        tokenBalance[_to] += _amount;

    }
}
