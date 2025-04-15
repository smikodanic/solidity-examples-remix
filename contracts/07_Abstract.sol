// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Animal {
    function speak() public view virtual returns (string memory);
}

contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "woof";
    }

    function speak2() public pure returns (string memory) {
        return "woof woof";
    }
}