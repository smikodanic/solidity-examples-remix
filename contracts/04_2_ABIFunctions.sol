// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
}


contract ABIFunctions {

    // use --> 123, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, Hello
    /* returned hash (every row has 32bytes):
0x
000000000000000000000000000000000000000000000000000000000000007b (uint256 123)
0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4 (address)
0000000000000000000000000000000000000000000000000000000000000060 (offset to string)
0000000000000000000000000000000000000000000000000000000000000005 (string length = 5)
68656c6c6f000000000000000000000000000000000000000000000000000000 ("hello" in hex)
    */
    function abiEncode(
        uint256 num,
        address addr,
        string memory text
    ) public pure returns (bytes memory) {
        return abi.encode(num, addr, text);
    }


    // decode hash given from abiEncode()
    // use hash: 0x000000000000000000000000000000000000000000000000000000000000007b0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000548656c6c6f000000000000000000000000000000000000000000000000000000
    function abiDecode(bytes memory hash) public pure returns (uint, address, string memory) {
        (uint num, address addr, string memory text) = abi.decode(hash, (uint, address, string));
        return (num, addr, text);
    }


    // use --> 123, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, Hello
    /* returned hash: 0x000000000000000000000000000000000000000000000000000000000000007b5b38da6a701c568545dcfcb03fcb875f56beddc448656c6c6f */
    function abiEncodePacked(
        uint256 num,
        address addr,
        string memory text
    ) public pure returns (bytes memory) {
        return abi.encodePacked(num, addr, text);
    }


    // use --> 123, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, Hello
    /* returned hash (every row has 32bytes):
0xcd498092
000000000000000000000000000000000000000000000000000000000000007b (uint256 123)
0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4 (address)
0000000000000000000000000000000000000000000000000000000000000060 (offset to string)
0000000000000000000000000000000000000000000000000000000000000005 (string length = 5)
68656c6c6f000000000000000000000000000000000000000000000000000000 ("hello" in hex)
    */
    function abiEncodeWithSelector(
        uint256 num,
        address addr,
        string memory text
    ) public pure returns (bytes memory) {
        bytes4 selector = bytes4(keccak256("abiEncode(uint256,address,string)")); // 0xcd498092   - 4 bytes
        return abi.encodeWithSelector(selector, num, addr, text);
    }


    // use --> 123, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, Hello
    /* returned hash (every row has 32bytes):
0xcd498092
000000000000000000000000000000000000000000000000000000000000007b (uint256 123)
0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4 (address)
0000000000000000000000000000000000000000000000000000000000000060 (offset to string)
0000000000000000000000000000000000000000000000000000000000000005 (string length = 5)
68656c6c6f000000000000000000000000000000000000000000000000000000 ("hello" in hex)
    */
    function abiEncodeWithSignature(
        uint256 num,
        address addr,
        string memory text
    ) public pure returns (bytes memory) {
        string memory signature = "abiEncode(uint256,address,string)";
        return abi.encodeWithSignature(signature, num, addr, text);
    }


    function abiEncodeCall(address to, uint256 amount) public pure returns (bytes memory) {
        // Encode the call with type-checking
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }


    // decode hash given from abiEncodeWithSelector() or abiEncodeWithSignature()
    // use for hash: 0xcd498092000000000000000000000000000000000000000000000000000000000000007b0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000548656c6c6f000000000000000000000000000000000000000000000000000000
    function abiDecode2(bytes calldata data) public pure returns (uint256, address, string memory) {
        bytes calldata trimmed = data[4:]; // Remove first 4 bytes (function selector)
        return abi.decode(trimmed, (uint256, address, string));
    }






}