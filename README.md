# MyToken

This Solidity program is a basic implementation of a token contract, demonstrating the fundamental concepts of creating and managing a custom cryptocurrency token on the Ethereum blockchain. The contract includes basic functionalities for minting and burning tokens, making it a useful starting point for those interested in understanding how tokens work within smart contracts.

## Description

The `MyToken` contract is a simple ERC20-like token written in Solidity, designed for educational purposes. It includes essential features such as minting new tokens and burning existing ones. The contract also tracks the total supply of tokens and the balances of individual addresses.

## Getting Started

### Executing the Program

To interact with this contract, users can use Remix, an online Solidity IDE. Follow these steps to get started:

1. **Access Remix IDE:**
   - Visit the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).

2. **Create a New File:**
   - In the left-hand sidebar, click on the "+" icon to create a new file.
   - Save the file with a `.sol` extension (e.g., `MyToken.sol`).

3. **Add the Contract Code:**
   - Copy and paste the following code into the new file:

     ```solidity
     // SPDX-License-Identifier: MIT
     pragma solidity ^0.8.18;

     import "@openzeppelin/contracts/access/Ownable.sol";

     contract MyToken is Ownable {

         // Public variables to store token details
         string public tokenName = "UniqueToken";
         string public tokenSymbol = "UTK";
         uint256 public totalTokenSupply;

         // Mapping to store balances of addresses
         mapping(address => uint256) public accountBalances;

         // Events
         event TokensMinted(address indexed to, uint256 amount);
         event TokensBurned(address indexed from, uint256 amount);

         // Mint function to create new tokens for a specific address
         function mintTokens(address _address, uint256 amount) public onlyOwner {
             require(amount > 0, "Amount must be greater than zero");
             // Increase total token supply and balance of the specified address
             totalTokenSupply += amount;
             accountBalances[_address] += amount;

             emit TokensMinted(_address, amount);
         }

         // Burn function to destroy tokens from a specific address
         function burnTokens(address _address, uint256 amount) public onlyOwner {
             require(amount > 0, "Amount must be greater than zero");
             require(accountBalances[_address] >= amount, "Insufficient balance");

             // Deduct tokens from total supply and balance of the specified address
             totalTokenSupply -= amount;
             accountBalances[_address] -= amount;

             emit TokensBurned(_address, amount);
         }
     }
     ```

4. **Compile the Code:**
   - Click on the "Solidity Compiler" tab in the left-hand sidebar.
   - Ensure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MyToken.sol" button.

5. **Deploy the Contract:**
   - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
   - Select the "MyToken" contract from the dropdown menu.
   - Click on the "Deploy" button.

6. **Interact with the Contract:**
   - After deployment, interact with the contract by calling the `mintTokens` and `burnTokens` functions.
   - To mint tokens, enter the address and amount, and click "transact."
   - To burn tokens, similarly enter the address and amount, and click "transact."

## Authors

Krishna Kumar
[LinkedIn](www.linkedin.com/in/krishna-kumar-4489562b5)

## License

This project is licensed under the MIT License - see the `LICENSE.txt` file for details.
