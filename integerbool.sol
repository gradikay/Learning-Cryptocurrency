// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

// Understading intengers and boolens

// Smart Contract
contract MyContract{
    
    // Creat an intenger
    uint256 public myUnit;
    
    // Function calling the intenger
    // Passing function with arguments (type _argument)
    function setMyUnit(uint _myUnit) public {
        myUnit = _myUnit;
    }
    
    // Creat a boolen
    bool public myBool;
    
    // Function calling boolen
    // Passing function with arguments (type _argument)
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    // uint8 goes from 0 to 255
    uint8 public myUint8;
    
    // Incrementing our variable myUint8
    // Passing function without arguments ()
    function incrementUint() public {
        myUint8++;
    }
    
    // Decrementing our variable myUint8
    // Passing function without arguments ()
    function decrementUint() public {
        myUint8--;
    }
    
    // Creating an address
    address public myAddress;
    
    // Function calling address variable
    // Passing function without arguments ()
    function setMyAddress(address _address) public {
        myAddress = _address;
    }
    
}






