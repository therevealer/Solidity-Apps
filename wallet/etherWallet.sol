// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherWallet {
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable { }

    function withdraw(uint amount) external{
        require(msg.sender == owner, "Caller is not the owner");
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}