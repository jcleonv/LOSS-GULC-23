// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SalaryPayment {
    address public employer;
    address public employee;
    address public taxAuthority;

    uint256 public salaryAmount;
    uint256 constant taxRate = 30;

    constructor(address _employee, address _taxAuthority, uint256 _salaryAmountInWei) {
        employer = msg.sender;
        employee = _employee;
        taxAuthority = _taxAuthority;
        salaryAmount = _salaryAmountInWei;  // Salary amount is directly set in wei
    }

    function paySalary() public {
        require(msg.sender == employer, "Only employer can make payments");
        uint256 tax = salaryAmount * taxRate / 100;
        uint256 netSalary = salaryAmount - tax;

        require(address(this).balance >= salaryAmount, "Insufficient funds for salary and tax");

        payable(taxAuthority).transfer(tax);
        payable(employee).transfer(netSalary);
    }

    receive() external payable {}
}
