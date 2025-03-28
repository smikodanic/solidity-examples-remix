// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceType_arraySlice {
    string[] public sarr = ['a', 'b', 'c', 'd'];


    function getSlice(uint[] calldata input) public pure returns (uint[] calldata) {
        // Return elements from index 1 to 3 (includes 1 and 2)
        return input[1:3]; // only calldata can use slice
    }


    function getSlice2() public pure returns(uint[] memory) {
        /* dynamic memory array */
        uint[] memory arr = new uint[](5);
        arr[0] = 10;
        arr[1] = 20;

        // uint[] memory arr_sliced = arr[2:4]; // will not work because of memory location


        /* fixed memory array */
        uint8[3] memory arr2 = [7, 8, 9];

        // uint8[] memory arr_sliced2 = arr2[2:4];  // will not work because of memory location


        /* storage array */
        // string[] storage sarr_sliced = sarr[1:3]; // will not work
        

        return arr;
    }


}
