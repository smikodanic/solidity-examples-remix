// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract GlobalVariables {

    // block
    function blockVars() external view returns (
        uint blockNumber,
        bytes32 previousBlockHash,
        uint basefee,
        uint blobbasefee,
        uint chainid,
        address coinbase,
        uint difficulty,
        uint gaslimit,
        uint prevrandao,
        uint timestamp,
        uint gasRemaining
    ) {
        // Get blockhash of previous block (current block's hash isn't available yet)
        previousBlockHash = blockhash(block.number - 1); // 0xb483a3b2407a1592255f8aa7f929a4f44dfe4cd745744a8fe4935f2fef4e55d1
        
        // EIP-1559 Base Fee
        basefee = block.basefee; // 0
        
        // EIP-4844 Blob Base Fee
        blobbasefee = block.blobbasefee; // 0
        
        // Chain ID
        chainid = block.chainid; // 31337
        
        // Miner's address
        coinbase = block.coinbase; // 0xC014BA5EC014ba5ec014Ba5EC014ba5Ec014bA5E
        
        // Block gas limit
        gaslimit = block.gaslimit; // 30000000
        
        // Block number
        blockNumber = block.number; // 13
        
        // Random number from beacon chain (post-Paris)
        prevrandao = block.prevrandao; // 97571247138466888709650237762216048135024179244986646192407437056360837632164

        // Difficulty (pre-Paris) / prevrandao alias (post-Paris)
        difficulty = block.difficulty; // 97571247138466888709650237762216048135024179244986646192407437056360837632164
        
        // Block timestamp in seconds format
        timestamp = block.timestamp; // 1743339159
        
        // Remaining gas
        gasRemaining = gasleft(); // 29978498
    }


    // Check if a complex operation fits in the current block
    function doWork() external view {
        require(gasleft() < block.gaslimit / 2, "Risk of out-of-gas");
        // ... heavy computation ...
    }


    // msg
    function msgData() external view returns (
        bytes calldata,
        address,
        bytes4
        // uint256
    ) {
        return (
            msg.data, // 0xc4c2bfdc
            msg.sender, // 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
            msg.sig // 0xc4c2bfdc
            // msg.value // must be payable
        );
    }


    // tx
    // NOTICE: In a Hardhat local node, transactions typically have zero gas fees. So gasprice and basefee will be 0.
    function txVars() external view returns (
        address origin,
        uint gasprice,
        uint basefee,
        uint priority_fee
    ) {
        origin = tx.origin; // 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        gasprice = tx.gasprice; // in wei 
        basefee = block.basefee; // in wei
        priority_fee = gasprice - basefee;
    }

    

}