// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error InsufficientBalance(uint available, uint required);

contract MyToken {
    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100; // Give initial tokens to deployer
    }

    function transfer(address to, uint amount) public {
        if (amount > balance[msg.sender]) {
            revert InsufficientBalance({
                available: balance[msg.sender],
                required: amount
            });
           // revert InsufficientBalance(balance[msg.sender], amount); // will also work
        }

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function transfer2(address to, uint amount) public {
        // require(amount <= balance[msg.sender], InsufficientBalance(balance[msg.sender], amount)); // Require with a custom error is only available using the via-ir pipeline.
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
}
