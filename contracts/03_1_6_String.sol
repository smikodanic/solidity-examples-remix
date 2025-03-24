// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringExample {

    string public fullText;

    function joinText() external returns (string memory) {
        string memory a = "Hello, ";
        string memory b = "Solidity!";
        fullText = string.concat(a, b); // "Hello, Solidity!"
        return fullText;
    }

    function joinText2() external pure returns (string memory) {
        string memory myMsg = "Hello, "   "everybody"; // "Hello, everybody!"
        return myMsg;
    }

}