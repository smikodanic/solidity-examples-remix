// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// A simple bank contract that accepts ETH
contract Bank {
    function deposit() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }
}


// A contract that calls Bank.deposit() using an external function type
contract Caller {
    function callDeposit(address bankAddr) public payable {
        // Define an external function type that matches Bank.deposit()
        function() external payable func = Bank(bankAddr).deposit;

        // Call the external function with the current msg.value
        func{value: msg.value}(); // {value: msg.value} special call option in Solidity that lets you send ETH along with a function call
    }

    function callGetBalance(address bankAddr) public view returns(uint) {
        function() external view returns(uint) func = Bank(bankAddr).getBalance;
        return func();
    }
}
