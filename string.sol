//SPDX-License-Idendifier: MIT

pragma solidity ^0.8.0;

// Smart Contract
contract MyContract{
    
    // Creat a string variable "myString"
    string public myString = "I Love Congo";
    
    // Function Calling myString variable
    function setMyString(string memory _myString) public {
        
        // Set myString
        myString = _myString;
    }
}
