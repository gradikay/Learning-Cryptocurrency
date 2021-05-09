// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Contract on mapping
contract MyContract{
    
    mapping(address => uint) public balanceReceived;
    
    // Function returning balance
    function getBalance() public view returns(uint) {
        
        // Return contract's "this" balance
        return address(this).balance;
    }
    

    // Function sending money
    function sendMoney() public payable {
        
        // Increase the balance by the amount refunded
        balanceReceived[msg.sender] += msg.value;
    }
    
    // Function withdrawing a certain amount of money
    // We are creating two fields "_to" for address & "_amount" for
    // the amount we want to send
    function withdrawMoney(address payable _to, uint _amount) public {
        
        // This is an "if statement",
        // We are making sure that the balance is greater than or equal to
        // the amount we are trying to send
        require(balanceReceived[msg.sender] >= _amount, "You do not have enough money!");
        
        // Reducing the amount of money in the address
        balanceReceived[msg.sender] -= _amount;
        
        // Transfer the requested amount
        _to.transfer(_amount);
    }
    
    // Function withdrawing money from
    // the account that received money
    // Note "payable" is used to send money
    function withdrawAllMoney(address payable _to) public {
        
        // Variable "_to" is transfering the money 
        // back to the sender - function withdrawAllMoney() public {} ~ without an argument
        // _to.transfer(address(this).balance); // Old transfer statement ^^^
        
        // Recording original balance
        uint balanceToSend = balanceReceived[msg.sender];
        
        // Setting balance sent to 0;
        balanceReceived[msg.sender] = 0;
        
        // Transfer balance back to sender
        _to.transfer(balanceToSend); // New transfer statement
        
    }
}
