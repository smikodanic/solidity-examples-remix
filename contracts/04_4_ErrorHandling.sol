// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// @title - assert, require, revert and try/catch

contract ErrorHandling {

    uint public myState = 5;
    uint public errorCount;
    error InsufficientAmount(uint amount, uint8 minAmount);


    function setState(uint s) public {
        myState = s;
    }

    //// ASSERT EXAMPLES
    function divide(uint a, uint b) public returns (uint) {
        myState = 100; // will be reverted to 5 if b is 0
        // assert(b != 0); // Fails with Panic(0x1) (Assertion error) - consume all gas
        return a / b; // Fails with Panic(0x12) (Division or modulo division by zero)  - when assert(b != 0) is commented - consume all gas
    }


    //// REQUIRE EXAMPLES
    function deposit(uint amount) public returns (uint) {
        myState = 100; // will be reverted to 5
        require(amount > 0); // Error: Transaction reverted without a reason string
        return amount;
    }

    function deposit2(uint amount) public returns (uint) {
        myState = 200; // will be reverted to 5
        require(amount > 0, 'The amount must be >0'); // Error: reverted with reason string 'The amount must be >0'
        return amount;
    }

    // This function generate error: UnimplementedFeatureError: Require with a custom error is only available using the via-ir pipeline.
    /*
    function deposit3(uint amount) public returns (uint) {
        myState = 300; // will be reverted to 5
        uint8 minAmount = 5;
        require(amount > minAmount, InsufficientAmount(amount,minAmount)); // UnimplementedFeatureError: Require with a custom error is only available using the via-ir pipeline.
        return amount;
    }
    */


    //// REVERT
    function risky(uint256 value) public returns (uint) {
        myState = 500; // will be reverted to 5
        if (value > 5) {
            revert(); // Error: Transaction reverted without a reason
        }
        return value;
    }

    function risky2(uint256 value) public returns (uint) {
        myState = 600; // will be reverted to 5
        if (value > 5) {
            revert("The value must be >5"); // Error: reverted with reason string 'The value must be >5'
        }
        return value;
    }

    function risky3(uint256 value) public returns (uint) {
        myState = 700; // will be reverted to 5
        if (value > 5) {
            revert InsufficientAmount(value, 5); // Exception while processing transaction: reverted with an unrecognized custom error (return data: 0xb7676ad6000000...
        }
        return value;
    }


    //// TRY/CATCH
    function isMyAddress(address addr) public returns(address adresa, bool isValid) {
        myState = 900; // will be reverted to 5
        if (addr == 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF) {
            return (addr, true);
        } else {
            revert("Bad address"); // throws Error with reason and catched with catch Error()
            // assert(false); // throws Panic(0x01) and catched with catch Panic()
        }
    }


    function rate(address token) public returns (address, bool) {
        require(errorCount < 10, "Too many errors");
        
        try this.isMyAddress(token) returns (address, bool) {
            return (token, true);
        } catch Error(string memory /*reason*/) {
            errorCount++;
            return (address(0), false);
        } catch Panic(uint /*errorCode*/) {
            errorCount++;
            return (address(0), false);
        } catch (bytes memory /*lowLevelData*/) {
            errorCount++;
            return (address(0), false);
        }
    }

}