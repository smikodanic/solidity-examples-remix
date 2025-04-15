// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - Mutability Rules
/*
- nonpayable → can become view or pure
- view → can become pure
- payable cannot be changed
*/

contract Base {
    // nonpayable by default
    function nonPayableFunc() public virtual returns (uint) {
        return 1;
    }

    function viewFunc() public view virtual returns (uint) {
        return block.number;
    }

    function payableFunc() public payable virtual returns (uint) {
        return msg.value;
    }
}

contract Derived is Base {
    // ✅ nonpayable → pure (allowed)
    function nonPayableFunc() public pure override returns (uint) {
        return 42;
    }

    // ✅ view → pure (allowed)
    function viewFunc() public pure override returns (uint) {
        return 100;
    }

    // ❌ payable → view/pure is NOT allowed
    // This will cause a compile-time error if uncommented
    /*
    function payableFunc() public override returns (uint) {
        return 0;
    }
    */
}
