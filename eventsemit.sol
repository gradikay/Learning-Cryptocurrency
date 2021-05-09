// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MyContract {
    
    // Mapping variable tokenBalance
    mapping(address => uint) public tokenBalance;
    
    // event defining variables to display on the blockchain
    // "emit" display the "event"
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor() {
        
        // Set the starting balance for the contract creator
        // to 100 tokens
        tokenBalance[msg.sender] = 100;
    }
    
    // Function sending tokens with two fields "to" and "amount"
    // Function returns a bool value
    function sendToken(address _to, uint _amount) public returns(bool) {
        
        // if statment : Checking that we have enough token to send
        require(tokenBalance[msg.sender] >= _amount, "You do not have enough tokens!");
        
        // if statment : 
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        
        // Transfer field: Transfer amount
        // _to.transfer(_amount); // this is available only to address payable
        tokenBalance[_to] += _amount;
        
        // emitting our "event"
        // (address _from, ..., ...) as (msg.sender, ..., ...)
        // (..., address _to, ...) as (..., _to, ...)
        // (..., ..., uint _amount) as (..., ..., _amount)
        emit TokensSent(msg.sender, _to, _amount);
        
        // Returns true on success & false on failure 
        return true;
    }
}
