// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Custom error for access control
error NotOwner(address caller);


contract ErrorExample {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

    // Only the owner can call this function
    function setValue(uint8 val) public {
        if (msg.sender != owner) {
            revert NotOwner(msg.sender); // will give 0x245aecd3000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb92266
        }

        // Action allowed only for owner
        value = val;
    }
}
