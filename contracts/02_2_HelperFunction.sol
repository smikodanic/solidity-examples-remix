// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title Simple contract with helper function out of contract

contract HelperFunction {
    uint public number;

    function setNumber(uint x) public {
        number = helper(x);
    }
}

// Function outside the contract
function helper(uint x) pure returns (uint) {
    return x + 1;
}
