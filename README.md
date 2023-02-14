#  ChainArch Automation Interface

## Installation

`` npm install @chain-arch/contracts``

`` yarn add @chain-arch/contracts ``


## Usage 

``` 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chain-arch/contracts/interfaces/automationInterface.sol"


contract Counter is AutomationInterface{
    uint public count;
    uint s_lastTimeStamp;
    uint public immutable i_interval;

    constructor(){
        s_lastTimeStamp = block.timestamp;
        i_interval = 300;
    }
    function increment() public {
        count++;
    }
    function decrement() public {
        count++;
    }
    function checkAutomationStatus() external view override returns(bool){
        bool automationStatus = (block.timestamp - s_lastTimeStamp)> i_interval;
        return automationStatus;
    }
    function automate() external override {
        increment();
        s_lastTimeStamp = block.timestamp;
   }
}
```