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
    function unoptimizedA0() public unoptimized("A") {
        for (uint256 i; i < 1; i++) {}
    }

    function optimizedA1() public optimized("A") {
        for (uint256 i; i < 1; ++i) {}
    }

    function optimizedA2() public optimized("A") {}

    function optimizedA3() public optimized("A") {}

    function optimizedA4() public optimized("A") {}

    function optimizedA5() public optimized("A") {}

    function unoptimizedB0() public unoptimized("B") {
        for (uint256 i; i < 1; i++) {}
    }

    function optimizedB1() public optimized("B") {
        for (uint256 i; i < 1; i += 1) {}
    }

    function optimizedB2() public optimized("B") {}

    function optimizedB3() public optimized("B") {}

    function optimizedB4() public optimized("B") {}

    function optimizedB5() public optimized("B") {}

    /*////////////////////////////
    |  ⚠️ WARNING  [☣️ BIOHAZARD]  |
    | -------------------------- |
    | Authorized personnel only. |
    ////////////////////////////*/

    function test() public {
        unoptimizedA0();
        optimizedA1();
        optimizedA2();
        optimizedA3();
        optimizedA4();
        optimizedA5();

        unoptimizedB0();
        optimizedB1();
        optimizedB2();
        optimizedB3();
        optimizedB4();
        optimizedB5();
    }
}
