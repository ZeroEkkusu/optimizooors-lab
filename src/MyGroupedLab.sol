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

import "src/GFlasks.sol";

contract MyGroupedLab is GFlasks {
    function methodA0() public unoptimized("A") {
        uint256 i;
        i++;
    }

    function methodA1() public optimized("A") {
        uint256 i;
        ++i;
    }

    function methodA2() public optimized("A") {}

    function methodA3() public optimized("A") {}

    function methodA4() public optimized("A") {}

    function methodA5() public optimized("A") {}

    function methodB0() public unoptimized("B") {
        uint256 i;
        i++;
    }

    function methodB1() public optimized("B") {
        uint256 i;
        i += 1;
    }

    function methodB2() public optimized("B") {}

    function methodB3() public optimized("B") {}

    function methodB4() public optimized("B") {}

    function methodB5() public optimized("B") {}

    /*////////////////////////////
    |  ⚠️ WARNING  [☣️ BIOHAZARD]  |
    | -------------------------- |
    | Authorized personnel only. |
    ////////////////////////////*/

    function test() public {
        methodA0();
        methodA1();
        methodA2();
        methodA3();
        methodA4();
        methodA5();

        methodB0();
        methodB1();
        methodB2();
        methodB3();
        methodB4();
        methodB5();
    }
}
