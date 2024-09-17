// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    // Public variables to store token details
    string public tokenName = "UniqueToken";
    string public tokenSymbol = "UTK";
    uint256 public totalTokenSupply;

    // Mapping to store balances of addresses
    mapping(address => uint256) public accountBalances;

    // Mint function to create new tokens for a specific address
    function mintTokens(address _address, uint256 amount) public {
        // Increase total token supply and balance of the specified address
        totalTokenSupply += amount;
        accountBalances[_address] += amount;
    }

    // Burn function to destroy tokens from a specific address
    function burnTokens(address _address, uint256 amount) public {
        // Check if the balance of account is greater than or equal to amount
        if (accountBalances[_address] >= amount) {
            // Deduct tokens from total supply and balance of the specified address
            totalTokenSupply -= amount;
            accountBalances[_address] -= amount;
        }
    }
}
