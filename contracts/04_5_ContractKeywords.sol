// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Parent {
    uint256 public parentValue;

    function setParentValue(uint256 _value) public {
        parentValue = _value;
    }
}


contract ContractKeywords is Parent {
    uint256 public value;

    /*** this ***/
    function setValue(uint256 _value) public {
        value = _value;
    }

    function selfCallSetValue(uint256 _value) public {
        this.setValue(_value); // Calling setValue within the same contract  - NOTICE: this. can be omitted
    }

    function getAddress() public view returns (address) {
        return address(this); // Getting the contract's address
    }


    /*** super ***/
    function setParVal(uint256 _value) public {
        super.setParentValue(_value); // Calling parent's function
    }


    /*** selfdestruct() - DEPRECATED ***/
    function destroy(address payable recipient) public {
        selfdestruct(recipient);
    }
}