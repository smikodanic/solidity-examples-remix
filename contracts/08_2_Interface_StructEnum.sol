// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @title - interface example with struct and enum


interface IToken {
    // Define an enum
    enum TokenType {
        Fungible,
        NonFungible
    }

    // Define a struct
    struct Coin {
        string obverse; // Front side description
        string reverse; // Back side description
    }

    // Function that uses the enum and struct
    function getTokenInfo(TokenType tokenType, Coin memory coin) external returns (string memory);
}


contract MyContract {
    // Function that uses the enum and struct from the interface
    function processToken(
          address tokenAddress, 
          IToken.TokenType tokenType, 
          IToken.Coin memory coin
        ) public returns (string memory) {
        IToken token = IToken(tokenAddress); // Cast address to the interface

        // Use the enum and struct
        string memory info = token.getTokenInfo(tokenType, coin);
        return info;
    }
}