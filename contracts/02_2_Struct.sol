// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructExample {
    // Define a struct
    struct Person {
        string name;
        uint age;
        bool isActive;
    }

    // Store a person
    Person public person;

    // Set person's data
    function setPerson(string memory _name, uint _age, bool _isActive) public {
        person = Person(_name, _age, _isActive);
    }

    // Get person's name (optional helper)
    function getName() public view returns (string memory) {
        return person.name;
    }
}
