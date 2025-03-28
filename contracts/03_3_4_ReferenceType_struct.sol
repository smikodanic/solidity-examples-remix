// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ReferenceType_struct {
    /* 1. DEFINE STRUCT */
    struct Person {
        string name;
        uint8 age;
        address walletAddress;
    }

    constructor() {
        createPerson("Default User", 18, msg.sender);
    }


    /* 2. STATE VARIABLES */
    Person public myPerson;
    Person[] public personArray;

    // Function to initialize the Person struct - (Sasa, 21, 0x1234567890abcdef1234567890abcdef12345678)
    function createPerson(string memory _name, uint8 _age, address _walletAddress) public {
        myPerson = Person(_name, _age, _walletAddress);
    }

    // Function to retrieve the name of the Person
    function getPerson() public view returns (string memory, uint8, address) {
        return (myPerson.name, myPerson.age, myPerson.walletAddress);
    }

    // Function to update the Person's age.
    function updatePersonAge(uint8 _newAge) public {
        myPerson.age = _newAge;
    }


    /* 3. Function to create a Person in memory and return it. */
    function createPersonInMemory(string memory _name, uint8 _age, address _walletAddress) public pure returns (Person memory) {
        Person memory newPerson = Person(_name, _age, _walletAddress);
        return newPerson;
    }


    /* 4. STORAGE ARRAY*/
    function addPersonToArray(string memory _name, uint8 _age, address _walletAddress) public {
        personArray.push(Person(_name, _age, _walletAddress));
    }

    function getPersonFromArray(uint _index) public view returns (string memory, uint, address) {
        require(_index < personArray.length, "Index out of bounds");
        return (personArray[_index].name, personArray[_index].age, personArray[_index].walletAddress);
    }
}