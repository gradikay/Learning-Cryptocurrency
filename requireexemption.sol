// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MyContract {
    
    // Mapping variable ~ balanceReceived
    mapping(address => uint) public balanceReceived;
    
    // Function receiving money
    // Use "payable" for any ~ function || variable ~ receiving money
    function receiveMoney() public payable {
        
        // Increase balance by the amount received
        balanceReceived[msg.sender] += msg.value;
    }
    
    // Use "payable" for any ~ function || variable ~ receiving money
    // A withdraw function needs a "if statment", "reduce balance argument" & "transfer field"
    // "if statment" : check for the amount sent to be less than or equal to the amount received
    // "reduce balance argument" : displays the amount received
    // "transfer field" : creates a field to enter the amount we want to send
    function withdrawMoney(address payable _to, uint _amount) public {
        
        // if statment : Checking for the amount to be less than or equal to
        // the amount received
        require(_amount <= balanceReceived[msg.sender], "Issuficient funds!");
        
        // Reduce balance argument: Decrease balance by the amount sent / refunded
        balanceReceived[msg.sender] -= _amount;
        
        // Transfer field: Transfer amount
        _to.transfer(_amount);
    }
}
