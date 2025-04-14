// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract FuncionModifier {

    modifier costs(uint price) {
        require(msg.value >= price, "Not enough ETH");
        _;
    }

    function buy() public payable costs(1 ether) {
        // Buyer must send at least 1 ETH
    }

}