// SPDX-License-Identifier: Unlicense

import "ds-test/test.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GFlask is DSTest {
    uint256 private gasUnoptimized;
    uint256 private funCounter;

    modifier unoptimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(false, startGas - endGas - 2);
    }

    modifier optimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gFlask(true, startGas - endGas - 2);
    }

    function gFlask(bool _optimized, uint256 gas) private {
        if (gas == 10) {
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
        emit log("\n");
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
        if (savings > 0) {
            uint256 per = (gasUnoptimized * 1e2) / 100;
            per = (uint256(savings) * 1e4) / per;
            emit log_named_decimal_uint("PERCENT (%)", per, 2);
        }
    }
}
