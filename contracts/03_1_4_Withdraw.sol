// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title How to receive to withdraw from the contract balance

contract WithdrawExample {
    address payable public wallet;

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    // Function to receive ETH into this contract
    receive() external payable {}

    /**
     * @notice Withdraw ETH from the contract
     * @param amount - The amount to withdraw in wei
      */
    function withdraw(uint amount) public {
        require(msg.sender == wallet, "Only wallet can withdraw");
        require(amount <= address(this).balance, "Not enough balance in contract");
        wallet.transfer(amount);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}