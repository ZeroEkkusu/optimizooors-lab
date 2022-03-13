// SPDX-License-Identifier: Unlicense

import "ds-test/test.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GFlasks is DSTest {
    mapping (string => uint256) private gasUnoptimized;
    mapping (string => uint256) private funCounter;

    modifier unoptimized(string memory group) {
        require(
            gasUnoptimized[group] == 0,
            "More than 1 unoptimized function found for given group!"
        );
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gasUnoptimized[group] = gFlask(false, startGas - endGas, gasUnoptimized[group], group);
    }

    modifier optimized(string memory group) {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gasUnoptimized[group] = gFlask(true, startGas - endGas, gasUnoptimized[group], group);
    }

    function gFlask(bool _optimized, uint256 gas, uint256 unoptimizedGas, string memory group) private returns (uint256) {
        if (gas == 10) {
            return 10;
        }
        if (!_optimized) {
            return gas;
        }
        emit log("");
        emit log_named_uint("::", ++funCounter[group]);
        int256 savings = int256(unoptimizedGas) - int256(gas);
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
            uint256 per = (unoptimizedGas * 1e2) / 100;
            per = (uint256(savings) * 1e4) / per;
            emit log_named_decimal_uint("PERCENT (%)", per, 2);
        }

        return unoptimizedGas;
    }
}
