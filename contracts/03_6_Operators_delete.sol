// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Operators_delete {
    // State variables
    uint public number = 42;
    bool public flag = true;
    address public user = 0x1234567890123456789012345678901234567890;
    string public message = "Hello";
    uint[] public nums = [1, 2, 3];
    mapping(address => uint) public balances;

    struct Person {
        string name;
        uint age;
    }

    Person public person = Person("Alice", 30);

    function demoDelete() public {
        // uint → 0
        delete number;

        // bool → false
        delete flag;

        // address → 0x000...0
        delete user;

        // string → ''
        delete message;

        // array → [] (clears entire array)
        delete nums;

        // array[i] → resets just that element
        nums.push(10);
        nums.push(20);
        delete nums[0]; // sets nums[0] = 0 (but keeps array length)

        // struct → resets all members
        delete person;

        // mapping → whole mapping can't be deleted, but key can
        balances[msg.sender] = 100;
        delete balances[msg.sender]; // sets balances[msg.sender] to 0
    }
}
