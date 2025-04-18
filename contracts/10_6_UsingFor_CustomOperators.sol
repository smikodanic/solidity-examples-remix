// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

type SmallFixed is uint16;

using {
    add as +,
    div as /
} for SmallFixed global;

uint32 constant SCALE = 100;

function add(SmallFixed a, SmallFixed b) pure returns (SmallFixed) {
    return SmallFixed.wrap(SmallFixed.unwrap(a) + SmallFixed.unwrap(b));
}

function div(SmallFixed a, SmallFixed b) pure returns (SmallFixed) {
    uint32 result = SmallFixed.unwrap(a) * SCALE / SmallFixed.unwrap(b);
    return SmallFixed.wrap(uint16(result));
}


contract OperatorDemo {
    function average(SmallFixed a, SmallFixed b) public pure returns (SmallFixed) {
        return (a + b) / SmallFixed.wrap(200);
    }
}
