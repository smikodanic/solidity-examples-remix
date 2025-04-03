// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

contract Uniswap_Sushiswap {
    address public owner;
    IUniswapV2Router02 public uniswapRouter;
    IUniswapV2Router02 public sushiswapRouter;

    /*
     * @param {address} _uniswapRouter: 0x7a250d3810FF7a349F6F0643cE6e62F1cB5C69C7
     * @param {address} _sushiswapRouter: 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F
     */
    constructor(address _uniswapRouter, address _sushiswapRouter) {
        owner = msg.sender;
        uniswapRouter = IUniswapV2Router02(_uniswapRouter);
        sushiswapRouter = IUniswapV2Router02(_sushiswapRouter);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Execute arbitrage trade
    function executeArbitrage(
        address tokenA,
        address tokenB,
        uint256 amountIn
    ) external onlyOwner {
        // Transfer tokens to the contract
        IERC20(tokenA).transferFrom(msg.sender, address(this), amountIn);

        // Approve routers to spend tokens
        IERC20(tokenA).approve(address(uniswapRouter), amountIn);
        IERC20(tokenA).approve(address(sushiswapRouter), amountIn);

        // Swap on Uniswap
        address[] memory pathUniswap = new address[](2);
        pathUniswap[0] = tokenA;
        pathUniswap[1] = tokenB;
        uniswapRouter.swapExactTokensForTokens(amountIn, 0, pathUniswap, address(this), block.timestamp + 300);

        // Swap back on Sushiswap
        uint256 balanceTokenB = IERC20(tokenB).balanceOf(address(this));
        address[] memory pathSushiswap = new address[](2);
        pathSushiswap[0] = tokenB;
        pathSushiswap[1] = tokenA;
        sushiswapRouter.swapExactTokensForTokens(balanceTokenB, 0, pathSushiswap, address(this), block.timestamp + 300);

        // Transfer profits to owner
        uint256 finalBalance = IERC20(tokenA).balanceOf(address(this));
        IERC20(tokenA).transfer(owner, finalBalance);
    }
}