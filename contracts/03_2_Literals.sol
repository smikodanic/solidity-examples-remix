// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiteralsAddress {

    function printAddress() public pure returns (address, address){
        address addr1 = 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF;
        address addr2 = address(0x123); // 0x0000000000000000000000000000000000000123
        // address addr3 = 0xdcad3a6d3569df655070ded06cb7a1b2ccd1d3af; // invalid address do not pass checksum EIP-55 because all letters are small
        return (addr1, addr2);
    }


    function printIntegers() external pure returns (uint, uint, uint, uint, int, uint128, int8) {
        uint n1 = 100_000; // decimal, it's 1000000
        uint n2 = 0x2a; // 42 in hex
        uint n3 = 12e3; // it's same as 12 * 10**3
        uint n4 = 12 * 10**3;
        int n5 = -55;

        uint128 n6 = 2.5 + 1 + 0.5; // valid only when sum is integre
        int8 n7 = -6 / 2; // rational literal - valid only when division result is integer

        return (n1, n2, n3, n4, n5, n6, n7);
    }


    function printMisc() external pure returns(uint, string memory, bool) {
        uint256 myNumber = 105; // 105 is an integer literal, uint256 is the data type
        string memory myString = "Solidity " 'is ' "\nthe best!"; // "Solidity is the best" is a string literal, string is the data type
        bool isTrue = true; // true is a boolean literal, bool is the data type
        return (myNumber, myString, isTrue);
    }

}