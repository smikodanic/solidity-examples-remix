// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocationExample {
    // array of string - storage location
    string[] public items;
    string private name;

    /* calldata vs memory - function parameter */
    //// Add items to storage [cheaper and newItem can't be modified]
    function addItem(string calldata newItem) external {
        // newItem = "Changed"; // NOT allowed
        items.push(newItem); // calldata → storage
    }

    //// Add items to storage [more expensive but newItem can be modified]
    function addItem2(string memory newItem) external {
        newItem = "Changed"; // allowed
        items.push(newItem); // calldata → storage
    }



    /* Copy storage to memory and return */
    function getAll() external view returns (string[] memory) {
        string[] memory copy = items; // storage → memory
        return copy;
    }



    function getItem(uint index) view external returns(string memory) {
        string storage current = items[index]; // reference to storage slot
        return current;
    }

    function updateName() view external returns (string memory) {
        string storage ref = name; // reference to the same storage string
        return ref;
    }

}
