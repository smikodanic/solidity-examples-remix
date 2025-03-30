// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorsExample {

    // overflow error - no gasses used due to pure function
    function ternaryOverflowtest() external pure returns (uint) {
        uint8 x = 255 + (true ? 1 : 0);  // reverted with panic code 0x11 (Arithmetic operation overflowed outside of an unchecked block)
        return x;
    }


    // increment / decrement
    function incDec() external pure returns(uint, uint, uint) {
        uint x = 5;
        uint y = x++; // y = 5, x becomes 6 (first assign then add)
        uint z = ++x; // x becomes 7, z = 7 (first add then assign)
        return (x, y, z);
    }

}