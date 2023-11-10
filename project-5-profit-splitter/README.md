# fintech-bootcamp-at-home/project-5-profit-splitter
Unlike projects 1-4, this project is Solidity-based, and thus doesn't have a notebook. Instead, this folder contains the smart contract written for the project and this README with the project prompt and implementation notes.

## Prompt
*"Your new start-up has created its own Ethereum-compatible blockchain to help connect financial institutions, but now the team wants to use it to help automate some of the company finances. The goal is to make things easier internally, increase transparency, and make accounting and auditing practically automatic. You will develop smart contracts with Solidity to pay employees, distribute profits to different tiers of employees, and distribute company shares for those employees in the equity incentive plan."*

## Approach
My first thought wasa contract that requests permission to distribute funds from a secondary address, but then I learned about the [`payable`](https://docs.soliditylang.org/en/latest/types.html#address) keyword. In a nutshell it allows any address to receive ETH, including the contract address. It also makes the [`receive()`](https://docs.soliditylang.org/en/latest/contracts.html#receive-ether-function) function available to define contract behavior upon receiving ETH.

With this, I planned to create a list of addresses to pay out, and map those to a payscale which could be used to distribute funds similar to a stock dividend.
> For example, if two employees are hired with a payscale of `100`, they would each get a 50/50 split of the funds received. If a third employee is added at `50`, now the first two would each get 40 percent, and the third employee would get 20 percent.

## Results
It went mostly as expected, but things like not being able to iterate through `mapping` keys or having to follow the [withdrawal pattern](https://docs.soliditylang.org/en/latest/common-patterns.html#withdrawal-from-contracts) for payouts opened my eyes to how different Solidity is, despite it's familiar look.

The end result is [this contract](./ProfitSplitter.sol), which when deployed, distributes any ETH (or equivalent) immediately to all the addresses on its `payees` list, proportional to their respective payscales.

While it doesn't really have tiered payments, the payscale system allows salaries to be assigned like a typical company. In that scenario, `payscale` is set to whatever the nominal salary is, and then `totalPayscale` funds are added each payroll cycle. It can support an equity program as-is, assuming shares are the native on-chain currency.

Since this was a business case, I implemented basic version of [ownership permissions](https://docs.openzeppelin.com/contracts/2.x/api/ownership) to prevent unauthorized additions or removals from payroll. I also added `toggleActive()` so the contract can be shut off if/when migrating to a newer version, and `totalDistributions` mapping tracks all-time payouts to support an audit trail.
