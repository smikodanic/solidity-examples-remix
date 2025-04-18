// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library RefTypeLib {
    // Function to modify a uint[]
    function modifyArray(uint[] storage arr, uint index, uint value) internal {
        arr[index] = value;
    }

    // Function to modify a mapping
    function modifyMapping(mapping(address => uint) storage map, address key, uint value) internal {
        map[key] = value;
    }

    // Function to modify a string
    function modifyString(string storage str, string memory strNew) internal {
        // Clear string storage str
        bytes storage strB = bytes(str);
        while (strB.length > 0) {
            strB.pop();
        }

        // Copy each character from memory to storage
        for (uint i = 0; i < bytes(strNew).length; i++) {
            strB.push(bytes(strNew)[i]);
        }
    }

    // This will not work !!!
    function modifyString2(string storage str, string memory strNew) internal {
        // str = strNew; // TypeError: Type string memory is not implicitly convertible to expected type string storage pointer.
    }

    // Function to modify a byte
    function modifyBytes(bytes storage b, bytes memory bNew) internal {
        // Clear string storage str
        while (b.length > 0) {
            b.pop();
        }

        // Copy each character from memory to storage
        for (uint i = 0; i < bNew.length; i++) {
            b.push(bNew[i]);
        }
    }

    // This will not work !!!
    function modifyBytes2(bytes storage b, bytes memory bNew) internal {
        // b = bNew; // TypeError: Type bytes memory is not implicitly convertible to expected type bytes storage pointer.
    }
}



contract RefTypeExample {
    using RefTypeLib for uint[];
    using RefTypeLib for mapping(address => uint);
    using RefTypeLib for string;
    using RefTypeLib for bytes;

    uint[] public myArray;
    mapping(address => uint) public myMapping;
    string public myString;
    bytes public myBytes;
    string public myBytesStr;

    constructor() {
        myArray = [1, 2, 3];
        myMapping[0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1] = 21;
        myMapping[0xa85233C63b9Ee964Add6F2cffe00Fd84eb32338f] = 51;
        myString = "Hello";
        myBytes = "World";
    }

    function do_modifyArray(uint index, uint value) external {
        myArray.modifyArray(index, value);
    }

    function do_modifyMapping(address key, uint value) external {
        myMapping.modifyMapping(key, value);
    }

    function do_modifyString(string memory newValue) external {
        myString.modifyString(newValue);
    }

    function do_modifyBytes(bytes memory newBytes) external {
        myBytes.modifyBytes(newBytes);
        myBytesStr = string(myBytes); // convert bytes to string
    }
}
