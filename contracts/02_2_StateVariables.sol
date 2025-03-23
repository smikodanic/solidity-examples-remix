// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariables {
    uint public count = 0; // state variable

    function increment() public {
        count += 1;
    }
}