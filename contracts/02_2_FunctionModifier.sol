// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Modifier Example - Only Owner Can Change Value

contract FunctionModifier {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner - msg.sender is address of who deployed the contract
    }

    // Modifier to allow only the owner to call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner"); // msg.sender is address of who called function
        _; // Run the rest of the function
    }

    // Function that can only be called by the owner
    function changeValue() public onlyOwner {
        value = 123;
    }

    // Function that can only be called by the owner
    function setValue(uint8 val) public onlyOwner {
        value = val;
    }
}
