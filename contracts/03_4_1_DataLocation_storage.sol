// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocation_storage {
    bool[3] public arr_storage = [true, true, true];

    struct User {
        string name;
        uint age;
        bool isActive;
    }
    User public userA = User('John', 21, false);



    /* storage to storage assigning will create a reference */
    function storageArray2storage_ref() public returns (bool[3] memory, bool[3] memory) {
        bool[3] storage arr = arr_storage; // CREATES REFERENCE
        arr[1] = false; // THIS WILL CHANGE arr_storage[1]
        return (arr_storage, arr);
    }

    // call this function after storageArray2storage_ref() is executed. It will return [true, false, true]
    function getArrStorage() external view returns (bool[3] memory) {
        return arr_storage;
    }


    /* memory (array) to storage assignment will create a copy */
    function memArr2storage_copy() external returns (bool[3] memory, bool[3] memory) {
        bool[3] memory arr = [true, true, true]; // this memory will be assigned to storage

        arr_storage = arr; // CREATES COPY (this will set arr_storage to [true, true, true])
        arr[2] = false; // THIS WILL NOT CHANGE arr_storage[2]

        return (arr_storage, arr);
    }


    /* memory (struct) to storage assignment will create a copy */
    function memStruct2storage_copy() external returns (User memory, User memory) {
        User memory userB = User('Eva', 34, true);

        userA = userB; // CREATES COPY (this will set userA to {name:'Eva', age:34, isActive:true})
        userB.name = 'Sara'; // THIS WILL NOT CHANGE userA.name

        return (userA, userB);
    }

    // call this function after memStr2storage_copy() is executed
    function getUsers() external view returns (User memory) {
        return userA;
    }


    /* calldata to storage assignment will create a copy */
    // use [true, true, true] for arr
    function callArr2storage_copy(bool[3] calldata arr) external returns (bool[3] memory, bool[3] memory) {
        arr_storage = arr; // CREATES COPY (set arr_storage to [true, true, true])
        
        // arr[2] = false; // THIS WILL NOT WORK BECAUSE calldata IS READ-ONLY
        arr_storage[2] = false; // THIS WILL NOT CHANGE arr[2]

        return (arr_storage, arr);
    }


}