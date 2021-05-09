// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Contract on mapping
contract MyContract{
    
    // Creating / Structuring our own datatype ~ Payment
    struct Payment {
        
        // Important variables
        uint amount;
        uint timestamps;
    }
    
    // - How to access ~ struct values ?? // Accessing "amount" 
    // & assigning a value of "100"
    
    // Payment public payment;
    // function setAmount() public {
        
    //     payment.amount = 100;
    // }
    
    // Creating / Structuring our own datatype ~ Balance
    struct Balance {
        
        // Important variables
        uint totalBalance;
        uint numPayments;
        // Mapping our payments from ~ struct Payment // Mapping a struct
        mapping(uint => Payment) payments;
    }
    
    // Mapping our ~balance which in turn maps our ~ payments ^^^
    mapping(address => Balance) public balanceReceived;
    
    // Function returning balance
    function getBalance() public view returns(uint) {
        
        // Return contract's "this" balance
        return address(this).balance;
    }
    

    // Function sending money
    function sendMoney() public payable {
        
        // Increase the balance by the amount refunded / returned
        // .totalBalance is defined in ~ struct
        balanceReceived[msg.sender].totalBalance += msg.value;
        
        // Creating a new ~ Payment
        // (msg.value, ...) is the "amount" defined in ~ struct
        // (..., block.timestamp) is the "timestamps" defined in ~ struct
        Payment memory payment = Payment(msg.value, block.timestamp);
        
        // Adding balance payment to balanceReceived
        // .payments is the mapping defined in ~ struct
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        
        // Increamenting the number of payments
        balanceReceived[msg.sender].numPayments++;
    }
    
    // Function withdrawing a certain amount of money
    // We are creating two fields "_to" for address & "_amount" for
    // the amount we want to send
    function withdrawMoney(address payable _to, uint _amount) public {
        
        // This is an "if statement",
        // We are making sure that the balance is greater than or equal to
        // the amount we are trying to send
        require(balanceReceived[msg.sender].totalBalance >= _amount, "You do not have enough money!");
        
        // Reducing the amount of money in the address
        balanceReceived[msg.sender].totalBalance -= _amount;
        
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
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        
        // Setting balance sent to 0;
        balanceReceived[msg.sender].totalBalance = 0;
        
        // Transfer balance back to sender
        _to.transfer(balanceToSend); // New transfer statement
        
    }
}
