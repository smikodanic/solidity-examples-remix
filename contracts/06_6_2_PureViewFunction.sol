// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract SubCtr {
}


contract PureViewFunc {
    uint storedValue = 13;
    event MyEvt(address sender);
    address payable public recipient = payable(0x000000000000000000000000000000000000dEaD);

    /***** pure *****/
    // Only works with inputs, no state access
    function add(uint a, uint b) public pure returns (uint) {
        // emit MyEvt(msg.sender); // will not work in pure
        // SubCtr subctr = new SubCtr();  // will not work in pure
        // recipient.transfer(1 ether);  // will not work in pure
        return a + b; // No state reads
    }

    

    /***** view *****/
    // Can read state but not change it
    function getValue() public view returns (uint) {
        // emit MyEvt(msg.sender); // will not work in view
        // SubCtr subctr = new SubCtr();  // will not work in view
        // recipient.transfer(1 ether);  // will not work in view
        return storedValue;
    }



    /***** no pure, no view *****/
     function setValue() public returns (uint) {
        emit MyEvt(msg.sender); // will work OK
        SubCtr subctr = new SubCtr();
        recipient.transfer(1 ether);

        storedValue = 21;
        return storedValue;
    }
}