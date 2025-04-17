// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Example with direct library function call, for example: MathLib.add();
Get library address with: address(MathLib);
*/


// Library for math operations
library MathLib {
    function add(uint a, uint b) external pure returns (uint) {
        return a + b;
    }

    function multiply(uint a, uint b) external pure returns (uint) {
        return a * b;
    }
}


// Contract using the library
contract Calculator {
    function addNumbers(uint a, uint b) public pure returns (uint) {
        return MathLib.add(a, b); // direct call
    }

    function multiplyNumbers(uint a, uint b) public pure returns (uint) {
        return MathLib.multiply(a, b); // direct call
    }

    function getLibAddr() public pure returns (address) {
        return address(MathLib); // get the library address
    }
}
