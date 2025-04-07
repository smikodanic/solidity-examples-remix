// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Interface for EIP-165 testing
interface IExample {
    function dummy() external view returns (bool);
}


// Child contract for type() demonstration
contract ChildContract {
    function sayHello() public pure returns (string memory) {
        return "Hello from Child!";
    }
}


contract TypeInfo {
    
    // ===== 1. Contract Type Info =====
    function getContractInfo() public pure returns (
        string memory name,
        uint creationCodeSize,
        uint runtimeCodeSize
    ) {
        // Get contract metadata
        name = type(ChildContract).name; // "ChildContract"
        
        // WARNING: These can't be called from inside the contract in real usage
        // (Compiled here for demo, but will fail in actual deployment)
        bytes memory creation = type(ChildContract).creationCode;
        bytes memory runtime = type(ChildContract).runtimeCode;
        
        return (
            name,
            creation.length, // Size of creation bytecode
            runtime.length   // Size of runtime bytecode
        );
    }


    // ===== 2. Interface Type Info =====
    function getInterfaceId() public pure returns (bytes4) {
        // Calculate interface ID (XOR of all function selectors)
        return type(IExample).interfaceId; 
        // For IExample with just dummy(): 0x5a28e936
    }


    // ===== 3. Integer Type Info =====
    function getIntegerRanges() public pure returns (
        int8 minInt8,
        int8 maxInt8,
        uint16 minUint16,
        uint16 maxUint16
    ) {
        return (
            type(int8).min,   // -128
            type(int8).max,   // 127
            type(uint16).min, // 0
            type(uint16).max  // 65535
        );
    }


    // ===== BONUS: Safe Integer Check =====
    function safeCast(int256 value) public pure returns (int64) {
        require(
            value >= type(int64).min && value <= type(int64).max,
            "Value out of int64 range"
        );
        return int64(value);
    }

}