// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Example showing delegatecall() and staticcall().
- Use delegatecall when the function needs to modify caller's storage.
- Use staticcall for view or pure functions. */


library MathLib {
    function increment(uint256 value) external pure returns (uint256) {
        return value + 1;
    }

    function add(uint a, uint b) external pure returns (uint) {
        return a + b;
    }
}


contract Calculator {
    address public mathLibAddress;
    uint256 public number; // simple state variable
    uint public suma;

    function setLibAddr(address _mathLibAddress) public {
        mathLibAddress = _mathLibAddress;
    }

    // A library function which is changing the state variable of this contract must use delegatecall()
    function incNumber() public returns (uint256) {
        (bool success, bytes memory result) = mathLibAddress.delegatecall(
            abi.encodeWithSelector(MathLib.increment.selector, number)
        );
        require(success, "MathLib delegatecall failed");

        number = abi.decode(result, (uint256)); // update state
        return number;
    }

    // A library function which is NOT changing the state variable of this contract (pure function) also can use delegatecall()
    function addNumbers(uint a, uint b) public returns (uint) {
        (bool success, bytes memory result) = mathLibAddress.delegatecall(
            abi.encodeWithSignature("add(uint256,uint256)", a, b)
        );
        require(success, "MathLib delegatecall failed");
        suma = abi.decode(result, (uint));
        return suma;
    }
}
