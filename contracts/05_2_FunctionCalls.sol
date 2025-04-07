// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract A {
    function get() external pure returns (uint) {
        return 42;
    }

    function receivePayment() public payable returns (uint) {
        return msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}


contract FunctionCalls {
    /*** External Function Call ***/
    A public a;

    // _a is the address of deployed contract A, for example: 0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1
    function setA(A _a) public {
        a = _a;
    }

    // another contract
    function callA() public view returns (uint) {
        return a.get(); // external call
    }

    // another contract
    function sendPayment() public payable {
        uint price = 0.1 ether;
        require(msg.value >= price, "The min ETH sent should be 0.1 ether");
        a.receivePayment{value: price}(); // Send 0.1 ETH with the call - msg.value should be 100000000000000000 wei
    }

    // same contract (always use internal call - without this)
    function calcTot_ext(uint x, uint y) public view returns (uint) {
        // External call to add()
        uint sum = this.add(x, y);
        return sum * 2;
    }
    
    
    
    /*** Internal Function Call ***/
    function add(uint v1, uint v2) public pure returns (uint) {
        return v1 + v2;
    }
    
    // internal call to add()
    function calculateTotal(uint x, uint y) public pure returns (uint) {
        uint sum = add(x, y); // if this.add(x, y) is used it will be EXTERNAL CALL
        return sum * 2;
    }


    /*** Named Parameters - {name: value, ...} ***/
    function calcTot_named(uint x, uint y) public pure returns (uint) {
        uint sum = add({v1: x, v2: y}); // used named params
        return sum * 2;
    }

    /** Omitted Parameter Names ***/
    // first arg is not accessible
    function add_omit(uint256, uint256 b) public pure returns (uint256) {
        return b + 1;
    }

    function add_omit_call(uint z) public pure returns(uint suma) {
        return add_omit(0, z);
    }
}