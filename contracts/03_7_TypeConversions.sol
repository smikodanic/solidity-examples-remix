// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypeConversions {

    // implicit uint
    function implicitConversion() external pure returns (uint) {
        uint8 y = 10;
        uint16 z = 20;
        uint32 x = y + z;   // Steps:
                            // 1. y (uint8) → uint16 (matches z)
                            // 2. Addition in uint16
                            // 3. Result converted to uint32 for x
        return x; // 30
    }


    // explicit integers
    function explicitIntegerConversion() external pure returns(uint, bytes32, uint,  bytes32, uint) {
        // Signed -> Unsigned
        int y = -3;
        uint x = uint(y);   // x = 0xffff...fd (same bits as -3)
                            // this will not give 3 but 115792089237316195423570985008687907853269984665640564039457584007913129639933
        bytes32 x2 = bytes32(x); // hex representation -> 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd (this is -3 in solidity)


        // Larger -> Smaller (Truncation)
        uint32 a = 0x12345678;
        uint16 b = uint16(a);       // b = 0x5678 (22136 in decimal, cuts off 0x1234)
        bytes2 b2 = bytes2(b);      // b2 = 0x5678 (correct bytes type conversion)


        // Smaller → Larger (Padding i.e. adding default values)
        uint16 s = 0x1234;
        uint32 l = uint32(s); // b = 0x00001234 (adds zeros)
        assert(s == l); // True

        return (x, x2, b, b2, l);
    }


    // explicit fixed bytes
    function explicitFixedBytesConversion() external pure returns(bytes1, bytes4) {
        // Larger -> Smaller (Truncation)
        bytes2 x = 0x1234;
        bytes1 y = bytes1(x); // y = 0x12 (first byte kept)

        // Smaller → Larger (Padding i.e. adding default values)
        bytes2 a = 0x1234;
        bytes4 b = bytes4(a); // b = 0x12340000 (zeros added to right)
        assert(a[0] == b[0]); // True (original bytes unchanged)

        return (y, b); // (0x12, 0x12340000)
    }


    // explicit dynamic bytes -> fixed bytes
    function explicitDynamicBytes2FixedBytesConversion() external pure returns(bytes memory, bytes3, bytes16) {
        bytes memory s = "abcdefgh";
        bytes3 b1 = bytes3(s); // "abc" (truncated)
        bytes16 b2 = bytes16(s); // "abcdefgh\0\0\0\0\0\0\0\0" (padded)

        return (s, b1, b2); // (0x12, 0x12340000)
    }


    // mixed bytes <--> integers conversions
    function mixedBytesIntegersConversion() external pure returns(uint16, uint32) {
        // same size
        bytes2 x = 0x1234;
        uint16 y = uint16(x); // Allowed (both 2 bytes)

        // different sizes
        bytes2 a = 0x1234;
        uint32 b = uint16(a);   // 1. Convert to uint16 → 0x1234
                                // 2. Then to uint32 → 0x00001234

        return (y, b); // (4660, 4660)
    }


    // address conversions
    /*
    NOTICE:
    In return statement:
    - b (an address payable) and b.balance will be returned.
    - c (a plain address) and c.balance will be returned. However, because c is a plain address, c.balance will return 0.
    */
    function addressConversions() external view returns(address, uint, address, uint) {
        // address -> address payable
        address a = 0xFaBE3b5A5E5E11a08D41aB53D65346ed6CB03546; // a is plain address and no access to: .balance and .transfer()/.send()
        address payable b = payable(a);  // convert to payable address

        // address payable -> address
        address c = address(b); // convert to plain address

        return (b, b.balance, c, c.balance);
    }


    function uintToAddress() public pure returns (address) {
        // uint160 (20 bytes) -> address
        uint160 u = uint160(0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045);
        address a = address(u);
        return a; // Returns 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045
    }

    function addressToUint() public pure returns (uint160) {
        // address -> uint160
        address a = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
        uint160 u = uint160(a);
        return u; // Returns integer representation 1238012972454248237435767387143779415173800484933
    }

    function bytesToAddress() public pure returns (address) {
        // bytes20 -> address
        bytes20 b = hex"d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"; // Same address as bytes
        address a = address(b);
        return a; // Returns 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045
    }

    function addressToBytes() public pure returns (bytes20) {
        // address -> bytes20
        address a = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
        bytes20 b = bytes20(a);
        return b; // Returns hex"d8dA6BF26964aF9D7eEd9e03E53415D37aA96045" i.e. 0xd8da6bf26964af9d7eed9e03e53415d37aa96045
    }


}