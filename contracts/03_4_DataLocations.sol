// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocationsMemory {
    // Storage variables (persist on-chain)
    string public storedText = "Hello";
    string[] public storedArray;

    
    /*** CALLDATA ***/
    // calldata → calldata (reference)
    function echoCalldata(string calldata input) external pure returns (string calldata, bytes calldata, string memory) {
        string memory msg_data = abi.decode(msg.data[4:], (string));
        return (input, msg.data, msg_data);
    }

    // calldata → memory (copy)
    function useInMemory(string calldata input) external pure returns (string memory) {
        string memory temp = input;
        return temp;
    }
    
    // calldata → storage (copy)
    function addToStorage(string calldata input) external {
        storedArray.push(input);
    }


}
