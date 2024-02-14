// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract singleSigWallet is ReentrancyGuard{
    using SafeMath for uint256;

    event Deposit(address indexed sender, uint amount, uint balance);
    event Withdraw(uint amount);

    address public owner;
    uint public balance;

    mapping (address => uint) public balances; // omo!

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor (){
        owner = msg.sender;
    }

    function deposit(uint amount) public payable {
        balance = balance.add(msg.value);
        balances[msg.sender] -= amount;

        emit Deposit(msg.sender, amount, balance);
    }

    function withdraw(uint amount) public onlyOwner nonReentrant {
        require(amount <= balance, "Insufficient balance");
        balance = balance.sub(amount);
        payable(owner).transfer(amount);

        emit Withdraw(amount);
    }
}