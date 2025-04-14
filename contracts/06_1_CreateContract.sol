// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - This example shows 3 ways to use external contracts within Child contract

contract Parent {
    function getName() public pure returns (string memory) {
        return "John Doe";
    }
}


contract ContractNew {
    function getAge() public pure returns (uint8) {
        return 21;
    }
}


// First compile and deploy this contract. After that use its address in Child contract.
contract ContractAddr {
    function isActive() public pure returns (bool) {
        return true;
    }
}



contract Child is Parent {
    // 1. Inherit from Parent contract
    function getParentName() public pure returns (string memory) {
        return getName(); // Inherited from Parent
    }


    // 2. Creating a new instance of ContractNew
    ContractNew public contractNewInstance = new ContractNew();

    function getContractNewAge() public view returns (uint8) {
        return contractNewInstance.getAge();
    }


    // 3. Using an address of a deployed ContractAddr
    ContractAddr public contractAddrInstance;

    constructor(address _contractAddr) {
        contractAddrInstance = ContractAddr(_contractAddr);
    }

    function getContractAddrActive() public view returns (bool) {
        return contractAddrInstance.isActive();
    }
}