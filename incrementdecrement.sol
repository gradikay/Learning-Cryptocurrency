// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

// Understading intengers and boolens

// Smart Contract
contract MyContract{
    
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
    
}
