#  ChainArch Smart Contract Automation

## Installation

```sh
# via Yarn
$ yarn add chain-arch
# via npm
$ npm install chain-arch --save
```

## Usage 

``` 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "chain-arch/interfaces/automationInterface.sol";


contract Counter is Automatable{

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