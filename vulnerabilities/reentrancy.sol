// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vulnerable {
    mapping (address => uint) public  balance;

    function withdraw(uint _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient balance");

        (bool success, ) = msg.sender.call{value: _amount} ("");
        require(success, "Transfer Failed");

        balance[msg.sender] -= _amount;
    }
}


// This code doesn't follow the  check-effects-interaction pattern
// Making it vulnerable to Reentrancy Attacks
// The attacker can call an external function repeatedly before state changes are made