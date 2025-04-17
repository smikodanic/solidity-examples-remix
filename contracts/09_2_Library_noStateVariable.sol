// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* The library can not have state variable, but can contain constants. */

library MathLib {
    uint constant MULTIPLIER = 100;
    // uint immutable creationTime; will not work
    // uint public result; // will not work

    function multiply(uint a) external pure returns (uint) {
        return a * MULTIPLIER;
    }
}


contract Calculator {
    function multi(uint a) public pure returns (uint) {
        return MathLib.multiply(a);
    }
}