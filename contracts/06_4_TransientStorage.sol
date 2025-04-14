// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyGuard {
    // to use 'transient' EVM version must be Cancun
    bool transient locked; // Transient lock

    modifier nonReentrant {
        require(!locked, "Reentrancy attempt");
        locked = true;
        _;
        locked = false; // Unlock after function execution
    }

    function sensitiveFunction() public payable nonReentrant {
        // ... sensitive code that shouldn't be reentered ...
        (bool success, ) = msg.sender.call{value: 1 ether}("");
        require(success);
    }
}