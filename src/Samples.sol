// SPDX-License-Identifier: Unlicense

// Welcome to the 🧪 Optimizooor's Lab!
//
// Get started:
// 1. Set  Solidity version below
// 2. Set `optimizer`       in `foundry.toml`
// 3. Set `optimizer_runs`  in `foundry.toml`
//
// Optimize! Run experiments with `forge test`.

// Experiment name: __________

pragma solidity 0.8.11;

import "src/Methods.sol";

contract Setup is Methods {}

contract Sample0 is Setup {
    function unoptimized() public {
        doSomething();
    }
}

// ----------------------------------

contract Sample1 is Setup {
    function optimized() public {
        doSomething();
    }
}

contract Sample2 is Setup {
    function optimized() public {}
}

contract Sample3 is Setup {
    function optimized() public {}
}

contract Sample4 is Setup {
    function optimized() public {}
}

contract Sample5 is Setup {
    function optimized() public {}
}
