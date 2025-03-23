// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UintExample {
    uint16 a = 10_000;   // it's 10000
    
    /*
        Solidity doesn’t support float/decimal types.
        The divide(5000) returns 5e17 (which is 0.5 * 1e18).
        You handle decimals manually off-chain (e.g. in your frontend divide by 1e18)
    */
    function divide(uint x) public view returns (uint) {
        return (x * 1e18) / a;
    }
    
}