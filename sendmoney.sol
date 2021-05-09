// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Example of sending money
// arguments in a function creates fields
contract Transaction{
    
    // variable for balance received
    uint public balanceReceived;
    
    // Function "receiveMoney" include payable for 
    // receiving functions
    function receiveMoney() public payable{
        
        // Return balance received
        balanceReceived += msg.value;
    }
    
    // Function getting the balance for the current 
    // contract "Transaction"
    function getBalance() public view returns(uint){
        
        // Return balance of this contract "Transaction"
        // use "this" to specify the current contract
        return address(this).balance;
    }
    
    // Function withdrawing money to 
    // the sender
    // CAUTION: anyone can withdraw funds 
    // given they have original / sender's address
    // HERE "to" is the sender 
    function withdrawMoney() public {
        
        // New variable "to" is the sender
        address payable to = payable(msg.sender);
        
        // Send the entire balance to the sender / original address
        to.transfer(getBalance());
    }
    
    // Function withdraw money given an argument
    // NOTE: best pactice than the example above ^^^
    // HERE "to" is given in a field
    function withdrawMoneyTo(address payable _to) public {
        
        // "to" is specified in a field
        
        // Send money to the given address
        _to.transfer(getBalance());
    }
}
