// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract singleSigWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    event Withdraw(uint amount);

    address public owner;
    uint public balance;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor (){
        owner = msg.sender;
    }

    function deposit(uint amount) public payable {
        balance += msg.value;

        emit Deposit(msg.sender, amount, balance);
    }

    function withdraw(uint amount) public onlyOwner {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(owner).transfer(amount);

        emit Withdraw(amount);
    }
}