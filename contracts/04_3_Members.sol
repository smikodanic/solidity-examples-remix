// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Members {

    function concatBytes() public pure returns (bytes memory) {
        bytes memory a = hex"01";
        bytes2 b = 0x0203;
        bytes1 c = 0x04;
    
        return bytes.concat(a, b, c); // Returns 0x01020304
    }


    function concatStrings() public pure returns (string memory) {
        string memory s1 = "Hello";
        string memory s2 = "World";
    
        return string.concat(s1, " ", s2); // Returns "Hello World"
    }


    function addrInfo(address addr) external view returns (
        uint balance, 
        bytes memory code, 
        bytes32 codehash
    ) {
        return (addr.balance, addr.code, addr.codehash);
    }


    // send ETH from sender address balance to recipient address balance
    function transferEther(address payable recipient) external payable {
        // msg.value is the ETH sent with the call
        recipient.transfer(msg.value);
    }


    function sendEther(address payable recipient, uint256 amount) public payable returns (bool) {
        bool success = recipient.send(amount);
        if (success) {
            // Transfer successful
            return true;
        } else {
            // Transfer failed
            return false;
        }
    }

    function sendEtherWithFallback(address payable recipient, uint256 amount) public payable {
        bool success = recipient.send(amount);
        if (!success) {
            // Transfer failed, perform fallback logic
            // Example: refund the sender
            payable(msg.sender).transfer(msg.value);
        }
    }


    // just send ETH with call()
    function sendETH_call(address payable recipient) external payable {
        (bool success, ) = recipient.call{value: msg.value}(""); // "": Empty bytes means no function is called (just sends ETH).
        require(success, "ETH transfer failed"); // will not send ETH back to sender. Use payable(msg.sender).transfer(msg.value);
    }


    // send ETH and call foo()
    function callOtherContract(address payable otherContract, uint256 x) external {
        // Encode the function call (e.g., "foo(uint256)")
        bytes memory data = abi.encodeWithSignature("foo(uint256)", x);
    
        (bool success, bytes memory result) = otherContract.call(data);
        require(success, "Call failed");
    
        // Decode the result (if needed)
        uint256 y = abi.decode(result, (uint256));
    }


    // get balance
    function getBalance(address recipient) external view returns(uint) {
        return recipient.balance;
    }






}