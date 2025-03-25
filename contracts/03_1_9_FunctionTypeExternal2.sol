// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - This eample shows how to use external function from 03_1_9_FunctionTypeExternal.sol::Bank contract

// use the ABI from Etherscan to define an interface
interface IBank {
    function getBalance() external view returns (uint);
}

// A contract that calls Bank.deposit() using an external function type
contract Caller2 {
    function callGetBalance2(address bankAddr) public view returns (uint) {
        return IBank(bankAddr).getBalance();
    }
}