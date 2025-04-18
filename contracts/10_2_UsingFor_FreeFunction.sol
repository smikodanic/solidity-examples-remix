// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* This example shows how to use free functions. */


// free function
function add(uint a, uint b) pure returns (uint) {
    return a + b;
}


contract FreeFuncExample {
    using { add } for uint; // attach add to uint type

    function addNumber(uint val1, uint val2) public pure returns (uint) {
        return val1.add(val2);
    }
}