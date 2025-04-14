const { ethers } = require("ethers");

// Configuration
const contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
const abi = [
  "event NormalTransfer(address indexed from, address indexed to, uint256 indexed amount, string memo)",
  "event AnonymousTransfer(address indexed from, address indexed to, uint256 indexed amount, bytes32 indexed txHash) anonymous",
  "function emitNormal()",
  "function emitAnonymous()"
];

// Local provider setup
const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");

async function main() {
  // Use the first Hardhat test account (address #0)
  const signer = provider.getSigner(0);
  const userAddress = await signer.getAddress();
  
  const contract = new ethers.Contract(contractAddress, abi, provider);

  // Listen to normal event
  contract.on("NormalTransfer", (from, to, amount, memo) => {
    console.log(`Normal: ${from} sent ${amount} to ${to} (${memo})`);
  });

  // Listen to anonymous events from specific address
  const filter = {
    address: contractAddress,
    topics: [
      null, // First topic (anonymous events have no signature)
      ethers.utils.hexZeroPad(userAddress, 32) // from address
    ]
  };

  provider.on(filter, (log) => {
    const decoded = contract.interface.decodeEventLog(
      "AnonymousTransfer",
      log.data,
      log.topics
    );
    console.log(`Anonymous: ${decoded.from} sent ${decoded.amount}`);
  });

  console.log(`Listening for events from ${userAddress}...`);
}

main().catch(console.error);