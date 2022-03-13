// SPDX-License-Identifier: Unlicense

import "src/GUnit.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GFlask is GUnit {
    uint256 private gasUnoptimized;
    uint256 private funCounter;

    modifier unoptimized() {
        require(
            gasUnoptimized == 0,
            "More than 1 unoptimized function found!"
        );

        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();

        (uint256 unoptimizedGas, uint256 counter) = GUnit.gFlask(
            false,
            startGas - endGas,
            gasUnoptimized,
            funCounter
        );
        gasUnoptimized = unoptimizedGas;
        funCounter = counter;
    }

    modifier optimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();

        (uint256 unoptimizedGas, uint256 counter) = GUnit.gFlask(
            true,
            startGas - endGas,
            gasUnoptimized,
            funCounter
        );
        gasUnoptimized = unoptimizedGas;
        funCounter = counter;
    }
}
