// SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.2;

contract ProfitSplitter {
    
    address public owner;
    address payable[] public payees;
    mapping(address payee => uint total) public totalDistributions; // audit trail
    mapping(address payee => uint8 payscale) public payroll; // payscale == 0 is inactive
    uint public totalPayscale;
    bool public inactive;

    mapping(address payee => uint funds) distributions;
    uint pendingDistributions;

    constructor() payable { owner = msg.sender; }
    
    // Any ETH received is immediately distributed proportional to totalPayscale, less pending distributions
    receive() external payable {
        require(inactive == false, "Inactive contract - cannot receive funds.");
        require(totalPayscale > 0, "No employees on payroll.");
        uint undistributed = address(this).balance - pendingDistributions;
        for (uint i = 0; i < payees.length; i++) {
            uint8 payscale = payroll[payees[i]];
            if (payscale == 0) continue;
            // https://docs.soliditylang.org/en/develop/units-and-global-variables.html#ether-units
            uint scale = (uint(payscale) * 1e18) / totalPayscale;
            uint split = (undistributed * scale) / 1e18;
            distributions[payees[i]] = split;
            pendingDistributions += split;
            totalDistributions[payees[i]] += split;
        }
    }

    // https://docs.soliditylang.org/en/latest/common-patterns.html#withdrawal-from-contracts
    function withdraw() external payable {
        uint amount = distributions[msg.sender];
        require(amount > 0, "No distributions available.");
        distributions[msg.sender] = 0;
        pendingDistributions -= amount;
        payable(msg.sender).transfer(amount);
    }

    function hire(address payable employee, uint8 payscale) external {
        require(msg.sender == owner, "Owner only.");
        require(payroll[employee] == 0, "Employee is already on payroll.");
        payroll[employee] = payscale;
        totalPayscale += payscale;
        payees.push(employee);
    }

    function fire(address employee) external {
        require(msg.sender == owner, "Owner only.");
        require(payroll[employee] > 0, "Employee not found.");
        totalPayscale -= payroll[employee];
        payroll[employee] = 0;
    }

    function update(address employee, uint8 payscale) external {
        require(msg.sender == owner, "Owner only.");
        require(payroll[employee] > 0, "Employee not found.");
        totalPayscale -= payroll[employee];
        payroll[employee] = payscale;
        totalPayscale += payscale;
    }

    function transferOwner(address newOwner) external {
        require(msg.sender == owner, "Owner only.");
        owner = newOwner;
    }

    function toggleActive() external {
        require(msg.sender == owner, "Owner only.");
        inactive = !inactive;
    }

}