// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* This example shows how to use library functions. */

// library
library CalculatorLib {
    function add(uint self, uint b) internal pure returns (uint) {
        return self + b;
    }
}


contract LibraryExample {
    using CalculatorLib for uint; // attach add to uint type

    function addNumber(uint val1, uint val2) external pure returns (uint) {
        return val1.add(val2); // val1 is self
    }
}