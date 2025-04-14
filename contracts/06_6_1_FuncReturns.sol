// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract FuncReturns {

    // named return
    function calculate(uint a, uint b) public pure returns (uint sum, uint product) 
    {
        sum = a + b;      // Assign to return variable
        product = a * b;  // No 'return' needed
    }


    // direct return
    function calculate2(uint a, uint b) public pure returns (uint, uint) 
    {
        return (a + b, a * b); // Return values directly
    }


    // direct return with named return variables
    function calculate3(uint a, uint b) public pure returns (uint suma, uint produkt) 
    {
        return (a + b, a * b); // Return values directly
    }
    

}