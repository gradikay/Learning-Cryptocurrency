// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// Start, Stop, Update Contract
contract MyContract {
    
    // owner variable
    address owner;
    
    // paused variable
    bool public paused;
    
    // Constructor are called only once
    constructor() {
        
        // owner variable is the sender
        owner = msg.sender;
    }
    
    // Function sending money
    function sendMoney() public payable{
        
    }
    
    function setPaused(bool _paused) public {
        
        // Check if the sender is the owner to withdraw 
        // the money
        require(msg.sender == owner, "You are not the owner");
        
        paused = _paused;
    }
    
    // Function withdraw money
    // Variable "_to"
    function withdrawMoney(address payable _to) public {
        
        // Check if the sender is the owner to withdraw 
        // the money
        require(msg.sender == owner, "You are not the owner");
        
        // Check if the contract has been paused
        require(!paused, "Contract has been paused");
        
        // transfer the money to the address
        _to.transfer(address(this).balance);
        
    }
}
