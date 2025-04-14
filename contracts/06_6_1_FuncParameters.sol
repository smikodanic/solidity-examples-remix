// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract FuncParameters {
    uint public suma;

    // omitted 2.nd parameter
    function sumaj(uint x, uint, uint y) public {
        suma = x + y;
    }

}