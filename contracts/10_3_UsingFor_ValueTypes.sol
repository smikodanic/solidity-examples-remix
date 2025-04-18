// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Value types: uint8-uint256, int8-int256, bool, address, address payable, bytes1-bytes32, enum */

// library
library ValueTypeLib {
    enum Color {
        Red,
        Green,
        Blue
    }

    function subtract(int self, int x) internal pure returns (uint) {
        return uint(self - x);
    }

    function logicalAnd(bool self, bool x) internal pure returns (bool) {
        return self && x;
    }

    function getBalance(address self) internal view returns (uint) {
        return  self.balance;
    }

    function sendETH(address payable self, uint amount) internal returns (bool){
        (bool success, ) = self.call{value: amount}("");
        return success;
    }

    function sumBytes1(bytes1 a, bytes1 b) internal pure returns (bytes1) {
        uint8 sum = uint8(a) + uint8(b);
        return bytes1(sum);
    }

    function getColorName(Color self) external pure returns (string memory) {
        if (self == Color.Red) {
            return "Red";
        } else if (self == Color.Green) {
            return "Green";
        } else if (self == Color.Blue) {
            return "Blue";
        } else {
            return "Invalid Color";
        }
    }

}


contract ValueTypesExample {
    using ValueTypeLib for int;
    using ValueTypeLib for bool;
    using ValueTypeLib for address;
    using ValueTypeLib for address payable;
    using ValueTypeLib for bytes1;
    using ValueTypeLib for ValueTypeLib.Color;

    function do_subtract(int val1, int val2) external pure returns (uint) {
        return val1.subtract(val2);
    }

    function do_logicalAnd(bool a, bool b) external pure returns (bool) {
        return a.logicalAnd(b);
    }

    function do_getBalance(address addr) external view returns (uint) {
        return addr.getBalance();
    }

    function do_sendETH(address payable addrp) external payable returns (bool success) {
        uint amount = msg.value;
        return addrp.sendETH(amount);
    }

    function do_sumBytes1(bytes1 a, bytes1 b) external pure returns (bytes1) {
        return a.sumBytes1(b);
    }

    // use 0,1 or 2 for c because c is uint8
    function do_getColorName(ValueTypeLib.Color c) external pure returns (string memory col) {
        return c.getColorName();
    }
}