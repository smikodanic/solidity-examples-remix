// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// @title - Usage of virtual and override. The virtual and override are not used together in the same contract for the same function.


contract A {
    string public x = "something";

    // this function will be overriden
    function foo() public virtual {
        x = "changed from contract A";
    }
}

contract B is A {
    function foo() public override {
        x = "changed from contract B";
    }
    // function foo() public override virtual {}  // will also work: override + virtual
}