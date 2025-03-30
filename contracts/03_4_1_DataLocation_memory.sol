// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocation_memory {
    bool[5] internal arr_storage = [true, true, true, true, true];

    struct User {
        string name;
        uint age;
        bool isActive;
    }

    User public userA;

    constructor () {
        userA = User('John', 21, false);
    }


    /* memory to memory assigning will create a reference */
    function memoryArray2mem_ref() public pure returns(bool[] memory, bool[] memory) {
        bool[] memory arr = new bool[](3); // [false, false, false]
        arr[1] = true; // [false, true, false]

        // assignment memory to memory will create reference
        bool[] memory arr_ref = arr; // CREATES REFERENCE
        arr_ref[1] = false; // THIS WILL ALSO CHANGE arr[1] !

        return (arr, arr_ref);
    }


    /* storage array to memory assigning will create a copy */
    function storageArray2mem_copy() public view returns(bool[5] memory, bool[5] memory) {
        bool[5] memory arr_copy = arr_storage; // CREATES COPY
        arr_copy[1] = false; // THIS WILL NOT CHANGE arr_storage[1] !

        return (arr_storage, arr_copy);
    }


    /* storage struct to memory assigning will create a copy */
    function storageStruct2mem_copy() public view returns(User memory, User memory) {
        User memory user_copy = userA; // CREATES COPY
        user_copy.name = 'Peter'; // THIS WILL NOT CHANGE userA.name !
        user_copy.age = 65; // THIS WILL NOT CHANGE userA.age !

        return (userA, user_copy);
    }


    /* calldata to memory assigning will also create a copy */
    // use [true, true] for arr_calldata during testing
    function calldataArray2mem_copy(bool[2] calldata arr_calldata) public pure returns(bool[2] memory, bool[2] memory) {
        bool[2] memory arr_copy = arr_calldata; // CREATES COPY
        arr_copy[1] = false; // THIS WILL NOT CHANGE arr_calldata[1] !

        return (arr_calldata, arr_copy);
    }



}