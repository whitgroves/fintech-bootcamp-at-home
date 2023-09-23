// SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.2;

/* Prompt goals:
    > pay employees - done
    > distribute profits to different tiers of employees
        > take previous table and map wallets to payment tiers
        > pay rate per tier - start at tier 0 and increment to top (lowest) tier
            > each tier gets 50% of the remaining amount
            > within each tier there is another N-way split
    > distribute company shares for employees in equity plan
        > setup transfer function for ERC20 tokens ... or does this work with receive() out of the gate?
*/

contract ProfitSplitter {

    mapping(address payee => uint payscale) public payroll; // using payscale > 0 as active flag
    uint public totalPayscale;

    address payable[] payees; // includes past payees -- how to clean up?
    mapping(address payee => uint funds) distributions;
    uint totalDistributions;

    constructor() payable {}
    
    // Any ETH received is immediately distributed proportional to totalPayscale, less pending distributions
    receive() external payable {
        require(totalPayscale > 0, "No employees on payroll.");
        uint undistributed = address(this).balance - totalDistributions;
        for (uint i = 0; i < payees.length; i++) {
            uint payscale = payroll[payees[i]];
            if (payscale == 0) continue;
            // https://docs.soliditylang.org/en/develop/units-and-global-variables.html#ether-units
            uint scale = (payscale * 1e18) / totalPayscale;
            uint split = (undistributed * scale) / 1e18;
            distributions[payees[i]] = split;
            totalDistributions += split;
        }
    }

    function hire(address payable employee, uint payscale) external {
        require(payroll[employee] == 0, "Employee is already on payroll.");
        payroll[employee] = payscale;
        totalPayscale += payscale;
        payees.push(employee);
    }

    function fire(address employee) external {
        require(payroll[employee] > 0, "Employee not found.");
        totalPayscale -= payroll[employee];
        payroll[employee] = 0;
    }

    function withdraw() external payable {
        uint amount = distributions[msg.sender];
        require(amount > 0, "No distributions available.");
        distributions[msg.sender] = 0;
        totalDistributions -= amount;
        payable(msg.sender).transfer(amount);
    }

}
