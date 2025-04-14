// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// this is free function
function add(uint a, uint b) pure returns (uint) {
    return a + b;
}

contract FreeFunc {
    function calculate(uint x, uint y) public pure returns (uint) {
        return add(x, y); // Free function called internally
    }
}
