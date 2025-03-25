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

    function showUnicode() external pure returns (string memory, string memory) {
        string memory myMsg = unicode"Hello, 😀"; // Unicode: U+1F600
        // string memory myMsg2 = "\u{1F600}"; // will not work
        string memory myMsg2 = unicode"Hi, \xf0\x9f\x98\x80"; // \xf0\x9f\x98\x80 is UTF hex encoding of \u{1F600} so the final result is Hi, 😄
        return (myMsg, myMsg2);
    }

    function showHex() external pure returns (string memory, string memory) {
        string memory myMsg = hex"48656c6c6f";
        string memory myMsg2 = hex"48_65_6c_6c_6f";
        return (myMsg, myMsg2);
    }

    // convert hex to string
    function hex2str() external pure returns (string memory) {
        bytes memory raw = hex"48656c6c6f"; // "Hello"
        string memory msgStr = string(raw); // valid UTF-8 → "Hello"
        return msgStr;
    }

}