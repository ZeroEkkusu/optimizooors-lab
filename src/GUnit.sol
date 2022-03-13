// SPDX-License-Identifier: Unlicense

import "ds-test/test.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GUnit is DSTest {
    function gFlask(
        bool _optimized,
        uint256 gas,
        uint256 unoptimizedGas,
        uint256 counter
    ) public returns (uint256, uint256) {
        if (gas == 10) {
            return (10, counter);
        }
        if (!_optimized) {
            return (gas, counter);
        }
        emit log("");
        emit log_named_uint("::", ++counter);
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

        return (unoptimizedGas, counter);
    }
}
