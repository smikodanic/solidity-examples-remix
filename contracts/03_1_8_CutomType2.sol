// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// 1️⃣ Define a custom value type for "Price" (wraps uint256)
type Price is uint256;

contract PriceManager {
    // 2️⃣ Helper to create a Price (safety checks can be added)
    function createPrice(uint256 _value) public pure returns (Price) {
        require(_value <= 1e30, "Price too high"); // Example validation
        return Price.wrap(_value);
    }

    // 3️⃣ Helper to unwrap Price back to uint256
    function getPriceValue(Price _price) public pure returns (uint256) {
        return Price.unwrap(_price);
    }

    // 4️⃣ Add two Prices (demonstrates type safety)
    function addPrices(Price a, Price b) public pure returns (Price) {
        return Price.wrap(Price.unwrap(a) + Price.unwrap(b));
    }

    // 5️⃣ Example usage
    function example() public pure {
        Price p1 = createPrice(100);
        Price p2 = createPrice(200);
        Price sum = addPrices(p1, p2);

        assert(getPriceValue(sum) == 300); // ✅ Works!
        // Price badSum = addPrices(p1, 50); // ❌ Compile error! (type mismatch)
    }
}