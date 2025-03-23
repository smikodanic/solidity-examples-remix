// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.22;

event HighestBidIncreased(address bidder, uint amount); // Event


contract EventExample {
    address public highestBidder; // initial value: 0x0000000000000000000000000000000000000000
    uint public highestBid; // initial value: 0

    function bid() public payable {
        require(msg.value > highestBid, "There is already a higher bid");

        // Update state
        highestBidder = msg.sender;
        highestBid = msg.value;

        // Trigger event
        emit HighestBidIncreased(msg.sender, msg.value);
    }
}
