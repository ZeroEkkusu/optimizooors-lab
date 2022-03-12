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
    function method0() public unoptimized {
        uint256 i;
        i++;
    }

    function method1() public optimized {
        uint256 i;
        ++i;
    }

    function method2() public optimized {}

    function method3() public optimized {}

    function method4() public optimized {}

    function method5() public optimized {}

    /*////////////////////////////
    |  ⚠️ WARNING  [☣️ BIOHAZARD]  |
    | -------------------------- |
    | Authorized personnel only. |
    ////////////////////////////*/

    function test() public {
        method0();
        method1();
        method2();
        method3();
        method4();
        method5();
    }
}
