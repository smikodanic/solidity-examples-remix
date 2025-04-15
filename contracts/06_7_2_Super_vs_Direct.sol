// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - This example show difference between super.foo() and direct call via B.foo()

contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo");
        super.foo(); // Calls A.foo()
    }
}

contract Main is B {
    function foo() public override {
        emit Log("Main.foo");

        super.foo(); // Calls B.foo(), which calls A.foo()
        A.foo();     // Directly calls BA.foo(), jumping over B
    }
}


/*
Event order:
1. Main.foo
2.1. B.foo
2.2. A.foo
3. A.foo
*/