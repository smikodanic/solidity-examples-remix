// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// any contract can use
uint constant MAX_VALUE = 100;
string constant GREETING = "Hello, World!";


contract ConstantCtr {
    function getValue() public pure returns (uint) {
        return MAX_VALUE; // Compiler replaces MAX_VALUE with 100
    }

    function getGreeting() public pure returns(string memory){
        return GREETING;
    }
}


contract ImmutableCtr {
    address immutable owner;
    uint immutable creationTime;

    constructor() {
        owner = msg.sender;          // Set during construction (deployment)
        creationTime = block.timestamp; // Set during construction (deployment)
    }

    function getOwner() public view returns (address) {
        return owner; // Access the immutable variable
    }

    function getCreationTime() public view returns(uint){
        return creationTime;
    }
}