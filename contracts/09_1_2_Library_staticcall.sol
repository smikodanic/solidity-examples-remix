// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* This example shows staticcall().
- Use it when function doesn't change caller contract state variable.
- No need to preserve msg.sender, msg.value, this, ... */

// Library for math operations
library MathLib {
    function add(uint a, uint b) external pure returns (uint) {
        return a + b;
    }
}

// Contract using the library via address
contract Calculator {
    address public mathLibAddress;
    
    function setLibAddr(address _mathLibAddress) public {
        mathLibAddress = _mathLibAddress;
    }

    function addNumbers(uint a, uint b) public view returns (uint) {
        (bool success, bytes memory result) = mathLibAddress.staticcall(
            abi.encodeWithSignature("add(uint256,uint256)", a, b)
        );
        require(success, "MathLib call failed");
        return abi.decode(result, (uint));
    }
}