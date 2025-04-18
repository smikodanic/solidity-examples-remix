// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Set {
    mapping(uint => bool) data;
}

using {insert, remove, contains} for Set;

function insert(Set storage self, uint value) returns (bool) {
    if (self.data[value]) return false;
    self.data[value] = true;
    return true;
}

function remove(Set storage self, uint value) returns (bool) {
    if (!self.data[value]) return false;
    self.data[value] = false;
    return true;
}

function contains(Set storage self, uint value) view returns (bool) {
    return self.data[value];
}

contract MyContract {
    Set private mySet;

    function addValue(uint value) public {
        require(mySet.insert(value), "Already exists");
    }

    function isPresent(uint value) public view returns (bool) {
        return mySet.contains(value);
    }
}
