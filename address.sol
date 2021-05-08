// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

// Understading intengers and boolens

// Smart Contract
contract MyContract{
    
    // Creating an address variable
    address public myAddress;
    
    // Function calling address variable
    // Passing function without arguments ()
    function setMyAddress(address _address) public {
        
        // Set myAddress variable
        myAddress = _address;
    }
    
    // Function requesting address' balance information
    function getBalanceOfAddress() public view returns(uint) {
        
        // returning the address variable with balance ".balance"
        return myAddress.balance;
    }
    
}
