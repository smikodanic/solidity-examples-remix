// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_string {
    string public name = string(abi.encodePacked(bytes4(0x4a6f686e))); // gives John


    function testMembers(string memory str1, uint16 position, string memory str2) external pure 
    returns (string memory, string memory, string memory, string memory, bool) {
        bytes memory b = bytes(str1); // converts string to bytes
        
        // length
        uint length = b.length;

        // find char at position
        require(position < length, "position outside of string bounds");
        bytes memory b2 = new bytes(1);
        b2[0] = b[position];
        string memory char = string(b2);

        // concat
        string memory concated = string.concat(str1, " -OK");

        // compare two string
        //// Solidity does not support == for strings directly, so we hash both strings and compare the hashes.
        bool isSame = keccak256(bytes(str1)) == keccak256(bytes(str2));

        return (str1, str2, char, concated, isSame);
    }


    function substr(string memory str, uint start, uint end) external pure returns (string memory) {
        require(end > start, "End must be greater than start");
        bytes memory b = bytes(str);
        require(end <= b.length, "End exceeds string length");

        bytes memory result = new bytes(end - start);
        for (uint i = start; i < end; i++) {
            result[i - start] = b[i];
        }

        return string(result);
    }


    function replaceAt(
        string memory original,
        uint position,
        string memory replacement
    ) external pure returns (string memory) {
        bytes memory originalBytes = bytes(original);
        bytes memory replacementBytes = bytes(replacement);

        require(position + replacementBytes.length <= originalBytes.length, "Replacement exceeds bounds");

        for (uint i = 0; i < replacementBytes.length; i++) {
            originalBytes[position + i] = replacementBytes[i];
        }

        return string(originalBytes);
    }


}