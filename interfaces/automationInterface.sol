// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface AutomationInterface {
    function checkAutomationStatus() external view returns (bool);

    function automate() external;
}