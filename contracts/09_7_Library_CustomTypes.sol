// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BigInt {
    struct bigint { uint[] limbs; }

    function add(bigint memory a, bigint memory b) internal pure returns (bigint memory) {
        uint[] memory result = new uint[](a.limbs.length + 1);
        uint carry;
        for (uint i; i < result.length; i++) {
            uint sum = a.limbs[i] + b.limbs[i] + carry;
            carry = sum / 10;
            result[i] = sum % 10;
        }
        return bigint(result);
    }
}

contract Crypto {
    using BigInt for BigInt.bigint;
    
    function addBigNumbers() public pure {
        BigInt.bigint memory x = BigInt.bigint(new uint[](1));
        BigInt.bigint memory y = BigInt.bigint(new uint[](1));
        BigInt.bigint memory z = x.add(y);
    }
}