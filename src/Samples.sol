// SPDX-License-Identifier: Unlicense

// Welcome to the 🧪 Optimizooor's Lab!
//
// Get started:
// 1. Set  Solidity version below
// 2. Set `optimizer`       in `foundry.toml`
// 3. Set `optimizer_runs`  in `foundry.toml`
//
// Optimize! Run experiments with `forge test`.

pragma solidity 0.8.11;

contract Sample0 {
    uint256 i;

    function unoptimized() public {
        i++;
    }
}

// --------------------------------

contract Sample1 {
    uint256 i;

    function optimized() public {
        ++i;
    }
}

contract Sample2 {
    function optimized() public {}
}

contract Sample3 {
    function optimized() public {}
}

contract Sample4 {
    function optimized() public {}
}

contract Sample5 {
    function optimized() public {}
}
