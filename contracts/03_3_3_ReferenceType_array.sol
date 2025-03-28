// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_array {
    // Fixed-size array (compile-time determined length)
    uint[3] public fixedArray = [1, 2, 3];
    
    // Dynamic array (storage)
    uint[] public dynamicStorageArray;


    // Initialize arrays in constructor
    constructor() {
        // Initialize dynamic storage array
        dynamicStorageArray.push(10);
        dynamicStorageArray.push(20);
        
        // Can't directly assign to fixedArray after declaration
        // fixedArray = [4,5,6]; // This would fail
    }
    

    // Create and return a new memory array
    function createMemoryArray(uint size) public pure returns (uint[] memory) {
        // uint[size] memory memoryArray;  - this will not work so use new
        uint[] memory memoryArray = new uint[](size); // Init array with zeros: [0, 0, 0, ...]
        
        
        for (uint i = 0; i < size; i++) {
            memoryArray[i] = i + 1; // Initialize values
        }

        // Will not work as dynamic array with fixed size doesn't have push() and pop()
        // memoryArray.pop();
        
        return memoryArray;
    }
    

    // Add element to dynamic storage array
    function addToDynamicArray(uint value) public {
        dynamicStorageArray.push(value);
    }
    

    // Get array lengths
    function getArrayLengths() public view returns (uint fixedLen, uint dynamicLen) {
        return (fixedArray.length, dynamicStorageArray.length);
    }


    // function shows difference between "new uint[](N)" and "uint[N]"
    function compareArrays() public pure returns (uint[] memory, uint[7] memory) {
        // Array 1: Dynamic with new
        uint[] memory a = new uint[](7); // [0,0,0,0,0,0,0]
        a[0] = 100;
    
        // Array 2: Fixed without new
        uint[7] memory b;
        b[0] = 100; // Other indices contain garbage until assigned
    
        return (a, b); // a=[100,0,...], b=[100,?,?,?,?,?,?]
    }

}