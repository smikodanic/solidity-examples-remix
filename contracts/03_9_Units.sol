// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnitsExample {

    // ether units -> converts gwei and ether to wei
    function etherUnits() external pure returns (uint40, uint) {
        // Base units (automatically multiplied)
        assert(1 wei == 1);          // Smallest unit (10⁰)
        assert(1 gwei == 1e9);       // 1,000,000,000 wei
        assert(1 gwei == 1e9 wei);       // 1,000,000,000 wei
        assert(1 ether == 1e18);     // 1,000,000,000,000,000,000 wei
        assert(1 ether == 1_000_000_000_000_000_000);

        // Usage examples
        uint40 gasPrice = 20 gwei;            // = 20 * 1e9 wei
        uint256 walletBalance = 1.5 ether;     // = 1.5 * 1e18 wei

        return (gasPrice, walletBalance); // (20000000000, 1500000000000000000)
    }


    // time units - converts minutes, hours, days, weeks to seconds
    function timeUnits() external pure returns(uint, uint, uint) {
        // Base conversions
        assert(1 == 1 seconds);
        assert(1 minutes == 60 seconds);
        assert(1 hours == 60 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);


        // Practical usage
        uint256 lockPeriod = 30 days;          // = 2,592,000 seconds
        // uint256 hourlyRate = 1000 / 1 hours;   //  Type rational_const 5 / 18 is not implicitly convertible to expected type uint256.
        // uint256 hourlyRate = (1000 * 1e18) / 1 hours;
        // uint256 hourlyRate = 1000 / uint256(1 hours); // Returns 0 (truncates) - Not recommended - loses all precision
        uint256 hourlyRate = 1000 ether / uint256(1 hours); // same as (100 * 1e18) / uint256(3600) Returns 277 (micro-tokens/sec)

        uint256 daysCount = 30;
        // uint256 invalid = daysCount days; // ❌ Error - Not for variables: Only work with literals
        uint256 valid = daysCount * 2 days; // ✅ Correct

        return (lockPeriod, hourlyRate, valid); // (2592000, 277777777777777777, 5184000)
    }

}