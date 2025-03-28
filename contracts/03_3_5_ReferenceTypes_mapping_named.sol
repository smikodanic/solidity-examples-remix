// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_mapping_named {
    mapping(address => uint) private balances;
    mapping(address addr => string name) public names; // named mapping for better readibility

    // Set balance for sender
    function setBalance(uint amount, string memory name) public {
        balances[msg.sender] = amount;
        names[msg.sender] = name;
    }

    // Get balance (optional since public getter already exists)
    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }

    // Get name
    function getName(address user) external view returns (string memory) {
        return names[user];
    }

    // get undefined mapping
    function getUndefined() external view returns (uint, string memory) {
        address noExistAddres = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        uint balance = balances[noExistAddres];
        string memory name = names[noExistAddres];
        return (balance, name); // return: (0, '')
    }
}
