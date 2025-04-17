// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ArrayLib {
    function sum(uint[] memory arr) internal pure returns (uint total) {
        for (uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
    }
}

contract SumArray {
    using ArrayLib for uint[]; // use library methods on uint[] type i.e. array of integers

    function getSum(uint[] memory numbers) public pure returns (uint) {
        return numbers.sum();
    }
}
