// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BooleanExample {
    
    // Pure function declares that no state variable will be changed or read
    function opAND(bool x, bool y) public pure returns (bool) {
        return x && y;
    }
    
}