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

import "src/GFlask.sol";

contract MyLab is GFlask {
    function unoptimized0() public unoptimized {
        for (uint256 i; i < 1; i++) {}
    }

    function optimized1() public optimized {
        for (uint256 i; i < 1; ++i) {}
    }

    function optimized2() public optimized {}

    function optimized3() public optimized {}

    function optimized4() public optimized {}

    function optimized5() public optimized {}

    /*////////////////////////////
    |  ⚠️ WARNING  [☣️ BIOHAZARD]  |
    | -------------------------- |
    | Authorized personnel only. |
    ////////////////////////////*/

    function test() public {
        unoptimized0();
        optimized1();
        optimized2();
        optimized3();
        optimized4();
        optimized5();
    }
}
