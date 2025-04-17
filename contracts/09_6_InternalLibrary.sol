// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Internal libraries are libraries where all functions are internal.
That means:
    - Their code is copied directly into the contract at compile time.
    - NO external calls, NO DELEGATECALL → ⚡ cheaper and faster.
    - You can use storage, memory, structs, arrays normally.
*/

// Internal library
library MathLibInternal {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }

    function double(uint a) internal pure returns (uint) {
        return 2 * a;
    }
}

// Contract using the internal library
contract Calculator {
    using MathLibInternal for uint;

    function addTwoNumbers(uint x, uint y) public pure returns (uint) {
        return x.add(y); // calling via library
    }

    function doubleNumber(uint x) public pure returns (uint) {
        return x.double();
    }
}
