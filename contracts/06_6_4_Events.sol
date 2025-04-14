// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventDemo {
    // Normal event (max 3 indexed params)
    event NormalTransfer(
        address indexed from,
        address indexed to,
        uint256 indexed amount,
        string memo  // Non-indexed
    );

    // Anonymous event (allows 4 indexed params)
    event AnonymousTransfer(
        address indexed from,
        address indexed to,
        uint256 indexed amount,
        bytes32 indexed txHash  // 4th indexed!
    ) anonymous;

    function emitNormal() public {
        emit NormalTransfer(msg.sender, address(0x123), 100, "Test");
    }

    function emitAnonymous() public {
        emit AnonymousTransfer(msg.sender, address(0x123), 100, keccak256("tx123"));
    }
}