// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_mapping_list {
    mapping(address => uint256) public balances;
    address[] public balanceHolders; // Tracks addresses with non-zero balance

    // Set or update a user's balance
    /* Use this addresses for test:
    0x1234567890abcdef1234567890abcdef12345678  
    0xdbAdBEA8ae70daD2ffc72c3b8aaeC831799CBb73
    0x83899DaB7e4639F4A6556a5B1122Fa8Ed7adA489
    */
    function setBalance(address user, uint256 amount) external {
        // Track new address only if it’s not already set
        if (balances[user] == 0 && amount != 0) {
            balanceHolders.push(user);
        }
        balances[user] = amount;
    }


    // Get total number of tracked users
    function getHolderCount() external view returns (uint256) {
        return balanceHolders.length;
    }


    // Get all balances
    function getAllBalances() external view returns (address[] memory, uint256[] memory) {
        uint256 length = balanceHolders.length;
        uint256[] memory amounts = new uint256[](length);

        for (uint i = 0; i < length; i++) {
            amounts[i] = balances[balanceHolders[i]];
        }

        return (balanceHolders, amounts);
    }


    // Delete balance and remove from tracking
    function deleteBalance(address user) external {
        if (balances[user] != 0) {
            delete balances[user]; // Set to default (0)

            // Remove user from balanceHolders array
            for (uint i = 0; i < balanceHolders.length; i++) {
                if (balanceHolders[i] == user) {
                    balanceHolders[i] = balanceHolders[balanceHolders.length - 1];
                    balanceHolders.pop();
                    break;
                }
            }
        }
    }

}
