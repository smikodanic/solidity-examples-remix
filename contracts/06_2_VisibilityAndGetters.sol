// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityDemo {
    // State Variables (Storage)
    uint public publicVar = 1;     // Auto-generates getter
    uint internal internalVar = 2; // Only this + child contracts
    uint private privateVar = 3;   // Only this contract

    // Function Visibility
    function publicFunc() public pure returns (string memory) {
        return "Anyone can call me (external or internal)";
    }

    function externalFunc() external pure returns (string memory) {
        return "Only other contracts/wallets can call me";
    }

    function internalFunc() internal pure returns (string memory) {
        return "Only this contract and children";
    }

    function privateFunc() private pure returns (string memory) {
        return "Only this contract";
    }

    // Accessing variables internally
    function getPrivateVar() public view returns (uint) {
        return privateVar; // Works (same contract)
    }

    // Calling functions internally
    function testInternalCall() public pure returns (string memory) {
        return internalFunc(); // Works (internal call)
    }

    // Array with auto-getter
    uint[] public numbers = [10, 20, 30];

    // Custom getter for full array
    function getAllNumbers() public view returns (uint[] memory) {
        return numbers;
    }
}



// Child contract demonstrating inheritance
contract Child is VisibilityDemo {
    function getParentVars() public view returns (uint, uint) {
        return (
            publicVar,    // Works (public)
            internalVar   // Works (internal)
            // privateVar // Would fail (private)
        );
    }


    function callParentFuncs() external pure {
        publicFunc();
        internalFunc();
    }
}


// External caller contract
contract Caller {
    VisibilityDemo demo = new VisibilityDemo();

    function callDemo() public view returns (uint, string memory, uint) {
        return (
            demo.publicVar(),          // Auto-getter works
            demo.externalFunc(),       // External function works
            demo.numbers(1)            // Returns 20 (array index 1)
            // demo.internalFunc()     // Would fail (internal)
            // demo.privateFunc()     // Would fail (private)
        );
    }
}