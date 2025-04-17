pragma solidity ^0.8.0;

/* Example shows that payable functions are not allowed withing library. */

library MathLib {
    // This is not allowed in a library:
    // receive() external payable {}

    // This is also not allowed:
    // fallback() external payable {}

    // This is also not allowed:
    // function myPayableFunc() external payable {}

    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
}

contract Caller {
    address public mathLibAddress;

    constructor(address _mathLibAddress) {
        mathLibAddress = _mathLibAddress;
    }

    function callAdd(uint a, uint b) public pure returns (uint) {
        return MathLib.add(a, b);
    }

    // Function to receive Ether (in the contract, not the library)
    receive() external payable {}
}
