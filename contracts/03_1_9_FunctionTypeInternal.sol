// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract FunctionTypeInternal {
    // Internal function type; The second parameter is function.
    function process(uint[] memory nums, function(uint) pure returns(uint) func) internal pure returns (uint[] memory) {
        uint[] memory results = new uint[](nums.length); // Creating an array and then allocate memory with new
        for (uint i = 0; i < nums.length; i++) {
            results[i] = func(nums[i]); // Calling the passed function
        }
        return results;
    }


    // this function will be used as parameter in process(nums, func)
    function double(uint x) internal pure returns (uint) {
        return x * 2;
    }


    function demo() public pure returns(uint[] memory){
        uint[] memory nums = new uint[](3);
        nums[0] = 1; nums[1] = 2; nums[2] = 3;
        
        // Pass 'double' as a function parameter
        uint[] memory result = process(nums, double); 

        return result;
    }
}

