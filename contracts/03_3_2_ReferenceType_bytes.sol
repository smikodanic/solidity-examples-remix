// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_bytes {
    // Fixed-size bytes (length defined at compile time)
    bytes3 public fixedBytes = hex"112233"; // 3-byte array

    // Dynamic bytes (length can vary)
    bytes public dynamicBytes;


    // Initialize dynamic bytes in constructor
    constructor() {
        dynamicBytes = hex"aabbccdd";
    }


    // Concatenate fixed and dynamic bytes
    function concatBytes() public view returns (bytes memory) {
        // Convert fixedBytes to dynamic bytes first
        bytes memory tempFixed = new bytes(fixedBytes.length);
        for (uint i = 0; i < fixedBytes.length; i++) {
            tempFixed[i] = fixedBytes[i];
        }

        // Concatenate using `bytes.concat()` (Solidity 0.8.12+)
        return bytes.concat(tempFixed, dynamicBytes);
    }


    // Get lengths
    function getLengths() public view returns (uint fixedLen, uint dynamicLen) {
        return (fixedBytes.length, dynamicBytes.length);
    }


    // proof that bytes is reference, not value
    function checkReference() public returns (bytes memory) {
        bytes storage ref = dynamicBytes; // Assigns storage reference
        ref[0] = 0xff; // Modify individual byte -  it will modify also dynamicBytes
        return dynamicBytes; // Returns 0xffbbccdd (original dynamicBytes is changed)
    }
    
}
