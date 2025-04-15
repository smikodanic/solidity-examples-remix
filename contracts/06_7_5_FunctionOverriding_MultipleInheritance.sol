// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - Multiple Inheritance - must use override(A, B) instead of override

contract A {
    function greet() public virtual pure returns (string memory) {
        return "Hello from A";
    }
}

contract B {
    function greet() public virtual pure returns (string memory) {
        return "Hello from B";
    }
}

// Since both A and B define `greet`, we must explicitly override both
contract C is A, B {
    // 👇 Must specify both A and B in override list
    function greet() public pure override(A, B) returns (string memory) {
        return "Hello from C";
    }
}