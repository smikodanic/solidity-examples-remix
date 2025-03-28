// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Helpers {
    function generateRandomAddress(uint256 seed) public view returns (address) {
        return address(uint160(uint256(keccak256(abi.encodePacked(block.timestamp, seed)))));
    }
}