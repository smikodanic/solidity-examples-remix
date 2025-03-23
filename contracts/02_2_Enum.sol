// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumExample {
    // Define an enum
    enum Status { Pending, Shipped, Delivered }

    // Store current status
    Status public currentStatus;

    // Set status to Shipped
    function shipOrder() public {
        currentStatus = Status.Shipped; // 1
    }

    // Set status to Delivered
    function deliverOrder() public {
        currentStatus = Status.Delivered; // 2
    }

    // Get current status as a number (0 = Pending, 1 = Shipped, 2 = Delivered)
    function getStatus() public view returns (Status) {
        return currentStatus;
    }
}
