// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract with receive()
contract MyRecevie {
    event Received(address sender, uint amount);

    // Triggered when ETH is sent to contract with empty data
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // View function to check balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}



// contract with fallback
contract MyFallback {
    string public lastCalled;
    uint public receivedEther;

    // Called when no function matches or data is invalid
    fallback() external payable {
        lastCalled = "fallback";
        receivedEther = msg.value;
    }

    // Called only when ETH is sent with no data
    receive() external payable {
        lastCalled = "receive";
        receivedEther = msg.value;
    }
}