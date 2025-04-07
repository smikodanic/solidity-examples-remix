// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ControlStructures {
    /*** if / else ***/
   function checkValue(uint256 value) public pure returns (string memory) {
        if (value > 10) {
            return "Value is greater than 10";
        } else if (value == 10) {
            return "Value is equal to 10";
        } else {
            return "Value is less than 10";
        }
    }

    /*** for loop ***/
    function sumArray(uint256[] memory arr) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }


    /*** while loop ***/
    function countDown(uint256 start) public pure returns (uint256) {
        uint256 count = 0;
        while (start > 0) {
            start--;
            count++;
        }
        return count;
    }

    /*** do-while loop ***/
    function firstCountDown(uint256 start) public pure returns (uint256){
        uint256 count = 0;
        do{
            start--;
            count++;
        } while (start > 0);
        return count;
    }


    /*** break & continue ***/
    function findValue(uint256[] memory arr, uint256 target) public pure returns (uint256) {
        uint result = type(uint).max; // without type(uint).max will give 0 because 0 is default for uint
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                result = i; // Found the target, exit the loop
                break;
            }
            if(arr[i] % 2 == 0){
                continue; // skips the rest of the loop, and moves to the next iteration.
            }
        }
        return result; // target not found.
    }

}