// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
    uint public x;

    constructor(uint a) payable {
        x = a;
    }
}



contract C {
    /***** CREATE opcode - no salt *****/
    // Create contract D during C’s deployment
    D public d = new D(4);

    // Dynamically create D later with any value
    function createD(uint arg) public returns(address) {
        D d1 = new D(arg);
        return address(d1);
    }

    // Create D and send Ether with it
    function createAndSendEther(uint arg, uint amount) public payable returns(address) {
        D d2 = new D{value: amount}(arg);
        return address(d2);
    }


    function get_x() public view returns(uint) {
        return d.x();
    }



    /***** CREATE2 opcode - with salt *****/
    function createDSalted(bytes32 salt, uint arg) public returns(address){
        D d3 = new D{salt: salt}(arg);
        return address(d3);
    }



    /***** Predict address before deploying *****/
    function predictAddress(bytes32 salt, bytes memory bytecode) public view returns (address) {
        return address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(bytecode)
        )))));
    }


}
