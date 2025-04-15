// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - Visibility Rules on Function Overriding
/*
Can only change external → public (not other visibilities).
*/

contract Base {
    function foo() virtual external view {}
}

contract Child is Base {
    function foo() override public pure {} // Stricter mutability
}
