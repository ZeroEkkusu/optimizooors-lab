// SPDX-License-Identifier: Unlicense

/*

    |////////////////////////////|
    |  ⚠️ WARNING  [ BIOHAZARD ]  |
    | -------------------------- |
    | Authorized personnel only. |
    |////////////////////////////|

*/

import {Setup} from "src/Samples.sol";
import "ds-test/test.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GFlask is DSTest {
    uint256 private gasEmpty;
    uint256 private gasUnoptimized;
    uint256 private funCounter;

    modifier unoptimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(false, startGas - endGas);
    }

    modifier optimized() {
        require(
            gasUnoptimized != 0,
            "No unoptimized function found (or the optimizer inlined it)!"
        );
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(true, startGas - endGas);
    }

    function gFlask(bool _optimized, uint256 gas) private {
        if (gas == gasEmpty) {
            return;
        }
        if (!_optimized) {
            require(
                gasUnoptimized == 0,
                "More than 1 unoptimized function found!"
            );
            gasUnoptimized = gas;
            return;
        }
        emit log("");
        emit log_named_uint("::", ++funCounter);
        int256 savings = int256(gasUnoptimized) - int256(gas);
        bool saved = savings > 0;
        if (savings == 0) {
            emit log("No savings.");
        } else {
            emit log_named_int(
                saved ? "SAVES (GAS)" : "[!] More expensive (gas)",
                savings
            );
        }
    }

    function measureEmpty() public {
        Empty e = new Empty();
        uint256 startGas = gasleft();
        e.optimized();
        uint256 endGas = gasleft();
        gasEmpty = startGas - endGas;
    }
}

contract Empty is Setup {
    function optimized() public {}
}
