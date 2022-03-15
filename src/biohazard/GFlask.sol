// SPDX-License-Identifier: Unlicense

/*

    |////////////////////////////|
    |  ⚠️ WARNING  [ BIOHAZARD ]  |
    | -------------------------- |
    | Authorized personnel only. |
    |////////////////////////////|

*/

import "ds-test/test.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
abstract contract GFlask is DSTest {
    uint256 private gasEmpty;
    uint256 private gasUnoptimized;

    modifier unoptimized(string memory label) {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(false, startGas - endGas, label);
    }

    modifier optimized(string memory label) {
        require(
            gasUnoptimized != 0,
            "No unoptimized function found (or the optimizer inlined it)!"
        );
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(true, startGas - endGas, label);
    }

    function gFlask(
        bool _optimized,
        uint256 gas,
        string memory label
    ) private {
        if (!_optimized) {
            require(
                gasUnoptimized == 0,
                "More than 1 unoptimized function found!"
            );
            measureEmpty();
            gasUnoptimized = gas;
            if (bytes(label).length != 0) {
                emit log(label);
            }
            return;
        }
        if (gas == gasEmpty) {
            return;
        }
        emit log("");
        if (bytes(label).length != 0) {
            emit log(label);
        }
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

    function measureEmpty() private {
        Empty e = new Empty();
        uint256 startGas = gasleft();
        e.optimized();
        uint256 endGas = gasleft();
        gasEmpty = startGas - endGas;
    }
}

import {SharedSetup} from "src/Samples.sol";

contract Empty is SharedSetup {
    function optimized() public {}
}
