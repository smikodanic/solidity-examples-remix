// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumExample {
    // Define an enum for different order statuses
    enum OrderStatus {
        Pending,    // 0
        Shipped,    // 1
        Delivered,  // 2
        Cancelled   // 3
    }

    // Store the status of an order
    OrderStatus public currentStatus;

    // Set the initial status to "Pending"
    constructor() {
        currentStatus = OrderStatus.Pending;
    }

    // Function to update the order status
    function updateStatus(OrderStatus _newStatus) public {
        currentStatus = _newStatus;
    }

    // Function to check if the order is shipped
    function isShipped() public view returns (bool) {
        return currentStatus == OrderStatus.Shipped;
    }

    // Function to reset status to "Pending"
    function resetStatus() public {
        currentStatus = OrderStatus.Pending;
    }

    // Convert OrderStatus to a string
    function getStatusString(OrderStatus _status) public pure returns (string memory) {
        if (_status == OrderStatus.Pending) return "Pending";
        if (_status == OrderStatus.Shipped) return "Shipped";
        if (_status == OrderStatus.Delivered) return "Delivered";
        if (_status == OrderStatus.Cancelled) return "Cancelled";
        revert("Invalid status"); // Fallback (should never reach here)
    }
}