// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// Custom error with a uint parameter
error CustomError(uint value);


contract Called {
    function mayFail(uint value) external pure {
        if (value == 0) {
            revert CustomError(value);
        }
        if (value == 1) {
            revert("Regular revert");
        }
        if (value == 2) {
            assert(false); // Panic error (e.g., 0x01 or similar)
        }
    }

    function succeed(uint value) external pure returns (uint) {
        return value * 2;
    }
}



contract Caller {
    Called public called;

    constructor(address _called) {
        called = Called(_called);
    }

    function doCall(uint value) public view returns (uint result, string memory reason) {
        try called.mayFail(value) {
            result = 1;
            reason = "Success";

        // DOESN'T WORK
        //} catch CustomError(uint errValue) {  // Specific catch for CustomError
        //   result = 2;
        //   reason = string(abi.encodePacked("CustomError with value: ", uintToString(errValue)));
        
        } catch Error(string memory revertReason) {
            result = 2;
            reason = revertReason; // Catch "Regular revert"
        } catch Panic(uint errorCode) {
            result = 3;
            reason = "Panic error";
        } catch (bytes memory) {
            result = 4;
            reason = "CustomError or unknown error";
        }
    }


    function doSuccessCall(uint value) public view returns (uint) {
        try called.succeed(value) returns (uint ret) {
            return ret;
        } catch {
            return 0;
        }
    }


    // Helper function to convert uint to string
    function uintToString(uint i) internal pure returns (string memory str) {
        if (i == 0) return "0";
        uint j = i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (i != 0) {
            bstr[k--] = bytes1(uint8(48 + i % 10));
            i /= 10;
        }
        str = string(bstr);
    }
}
