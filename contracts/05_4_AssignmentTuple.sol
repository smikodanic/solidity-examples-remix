// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignmentTuple {
    // State variable
    uint public result;

    // Function returning a tuple of 3 values
    function getData() public pure returns (uint, bool, uint) {
        return (10, true, 99);
    }

    // update state variable
    function updateResult() public {
        (result, , ) = getData(); // Assign only the first value to state variable
    }


    // destructuring
    function desctruct() public pure {
        (uint x, bool y, uint z) = getData();
    }


    // swap variables
    function swaping() public pure {
        uint x = 10;
        uint y = 20;
        (x, y) = (y, x); // Now x=20, y=10 
    }


    /* Reference Type Warning (arrays, strings, structs)
       Be careful when assigning arrays or structs, because memory vs. storage changes behavior.*/
    uint[20] public x; // state variable

    // Takes a MEMORY copy → Modifications are lost
    function g(uint[20] memory y) internal pure {
        y[2] = 3; // Only changes the local copy
    }

    // Takes a STORAGE reference → Modifies original
    function h(uint[20] storage y) internal {
        y[3] = 4; // Actually updates x[3] in storage
    }

    function test() public {
        g(x); // Passes a COPY (memory) → No effect on storage
        h(x); // Passes a REFERENCE (storage) → Modifies x
    }



}
