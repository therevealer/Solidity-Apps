// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    event submitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );

    event confirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeTransaction(address indexed owner, uint indexed txIndex);
    event executeTransaction(address indexed sender, uint indexed txIndex);

    // Stores the Owners addresses in an Array
    address [] public owners;
    uint public numConfirmations;
}






// The wallet owners can

//submit a transaction
//approve and revoke approval of pending transactions
//anyone can execute a transaction after enough owners has approved it.
