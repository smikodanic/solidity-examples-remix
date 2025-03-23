// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressPayable {
    address public regularAddress;
    address payable public wallet;

    // Set addresses, for example: 0xabc1234567890defabc1234567890defabc12345 and 0x90ff0e4b8d3c2a1a23456789edef1234567890ab
    function setAddresses(address _regular, address payable _wallet) external {
        regularAddress = _regular;
        wallet = _wallet;
    }

    /*** WALLET ***/
    
    // Transfer Ether to the payable address i.e. wallet
    function transferEther() external payable {
        wallet.transfer(msg.value); // will revert if transfer fails
    }

    // Send Ether to the payable address i.e. wallet
    function sendEther() external payable {
        bool success = wallet.send(msg.value);
        require(success, "Send failed"); // will revert if success is false
    }

    // Check wallet balance
    function getBalance() external view returns (uint) {
        return wallet.balance;
    }


    /*** CONTRACT DEPOSIT ***/

    // send ETH to address(this).balance
    function depositContractBalance() external payable {}

    // send from address(this).balance to wallet
    function emptyContract() public payable {
        (bool success, ) = wallet.call{value: address(this).balance}("");
        require(success, "Call failed");
    }
    
    /*
    function depositContract2() public payable {
        // (bool success, ) = address(this).call{value: wallet.balance}(""); // will not work because msg.sender is not wallet owner i.e. msg.sender != wallet
        (bool success, ) = address(this).call{value: msg.value}(""); // no sense because due to payable it's already sent to contract's balance
        require(success, "Call failed");
    }
    */

    // Check the contract address balance
    function getBalanceContract() public view returns (uint) {
        return address(this).balance;
    }


    // get addresses
    function listAdresses() public view returns (address, address, address) {
        return (regularAddress, wallet, address(this));
    }
}
