// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Helpers {
    function generateRandomAddress(uint256 seed) public view returns (address) {
        return address(uint160(uint256(keccak256(abi.encodePacked(block.timestamp, seed)))));
    }


    // divide two integers and return string (float)
    function divideAndConvertToString(uint256 numerator, uint256 denominator) public pure returns (string memory) {
        require(denominator != 0, "Division by zero");

        uint256 quotient = (numerator * 10**18) / denominator; // 18 decimal places

        string memory result = "";
        uint256 wholePart = quotient / 10**18;
        uint256 fractionalPart = quotient % 10**18;

        // Convert whole part to string
        if (wholePart == 0) {
            result = "0";
        } else {
            result = _uintToString(wholePart);
        }

        result = string.concat(result, ".");

        // Convert fractional part to string (with leading zeros)
        string memory fractionalString = _uintToString(fractionalPart);
        uint256 fractionalLength = bytes(fractionalString).length;

        for (uint256 i = fractionalLength; i < 18; i++) {
            result = string.concat(result, "0");
        }

        result = string.concat(result, fractionalString);

        return result;
    }

    function _uintToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            temp /= 10;
            digits++;
        }

        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + value % 10));
            value /= 10;
        }

        return string(buffer);
    }
}