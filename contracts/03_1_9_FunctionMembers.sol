// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// @title - function members .address (give contract address) and .selector (returns the function ABI)

contract FunctionMembers {
    function f() public payable returns (bytes4) {
        assert(this.f.address == address(this)); // verify which contract owns the function. If the condition is false, it causes a Panic and reverts the transaction
        return this.f.selector; // first 4 bytes of keccak256 hash of the function signature
    }

    function g() public {
        this.f{gas: 10000, value: 800}();
    }
}