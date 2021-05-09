// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MyContract {
    
    // Set variable myMapping
    mapping(uint => bool) public myMapping;
    // Set variable myAddress-
    mapping(address => bool) public myAddress;
    
    // Setting "_index" to bool true for "myMapping" variable
    function setValue(uint _index) public {
        
        // setting given index to true
        myMapping[_index] = true;
    }
    
    // Notice that we do not pass a parameter
    function setMyAddressToTrue() public {
        
        // Setting sender address to true
        myAddress[msg.sender] = true;
    }
    
}
