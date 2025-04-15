// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - simple interface example

interface IGreeter {
    function greet() external view returns (string memory);
}


contract Greeter is IGreeter {
    function greet() external pure override returns (string memory) {
        return "Hello!";
    }
}