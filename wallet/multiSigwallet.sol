// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSigWallet {
    //Events
    event Deposit(address indexed sender, uint amount, uint balance);
    event submitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data //allows you to include arbitrary binary data as part of the event.
    );
    
    event confirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeTransaction(address indexed owner, uint indexed txIndex);
    event executeTransaction(address indexed sender, uint indexed txIndex);

    //Data types & Data structures
    address [] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmations;

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }
    // Nested mapping from txIndex to boolean
    mapping(uint => mapping(address => bool)) public isConfirmed;

    //Child Element of the Transaction struct
    Transaction[] public transactions;

    //Modifiers
    modifier onlyOwner(){
        require(isOwner[msg.sender], "Sender not the owner");
        _;
    }
    modifier txExists(uint _txIndex){
        require(_txIndex < transactions.length, "Transaction does not exist");
        _;
    }
    modifier notExecuted(uint _txIndex){
        require(!transactions[_txIndex].executed, "Transaction already executed");
        _;
    }
    modifier notConfirmed(uint _txIndex){
        require(!isConfirmed[_txIndex][msg.sender], "Transaction already confirmed");
        _;
    }
  
}






// The wallet owners can

//submit a transaction
//approve and revoke approval of pending transactions
//anyone can execute a transaction after enough owners has approved it.
