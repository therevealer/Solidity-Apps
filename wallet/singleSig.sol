// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract singleSigWallet is ReentrancyGuard{
    using SafeMath for uint256;

    event Deposit(address indexed sender, uint amount, uint balance);
    event Withdraw(address indexed recipient, uint amount, uint balance);

    address public owner;
    uint public balance;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor (){
        owner = msg.sender;
    }

    receive() external payable { }

    function deposit(uint amount) external payable {
        require(amount > 0, "Deposit amount must be greater than 0");

        balance = balance.add(amount);
        emit Deposit(msg.sender, amount, balance);
    }


    function withdraw(address recipient, uint amount) public onlyOwner nonReentrant {
        require(amount <= balance, "Insufficient balance");
        require(recipient != address(0), "Invalid address");

        balance = balance.sub(amount);
        payable(recipient).transfer(amount);

        emit Withdraw(recipient, amount, balance);
    }
}

// Done