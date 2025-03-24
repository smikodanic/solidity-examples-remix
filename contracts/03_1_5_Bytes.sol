// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesExample {
    bytes public data;   // dynamic binary data, not fixed size
    bytes8 public dataFixed = 0x1234567890ffac00; // fixed size data
    bytes1[] public byteArray;   // Array of single-byte values

    // Store raw data as bytes: 0x12345678
    function storeData(bytes memory _input) public {
        data = _input;
    }

    // Store each byte individually into bytes1[] array
    function storeAsByteArray(bytes memory _input) public {
        delete byteArray; // clear previous
        for (uint i = 0; i < _input.length; i++) {
            byteArray.push(_input[i]);
        }
    }

    // Get number of bytes stored
    function getDataLength() public view returns (uint) {
        return data.length;
    }

    // Get length of byteArray
    function getByteArrayLength() public view returns (uint, bytes1[] memory) {
        return (byteArray.length, byteArray);
    }

    function printBytes8() external view returns(bytes8) {
        return dataFixed;
    }
}
