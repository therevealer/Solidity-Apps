// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract EncodeSomething{

    // In this function, we encode the number one to what it'll look like in binary
    // Or put another way, we ABI encode it.
    function encode() public pure returns(bytes memory){
        bytes memory num = abi.encode(1);
        return num;
    }
}
