// SPDX-License-Identifier: Unlicense

import "src/GUnit.sol";

/// @title GFlask
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GFlasks is GUnit {
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

        (uint256 unoptimizedGas, uint256 counter) = GUnit.gFlask(
            false,
            startGas - endGas,
            gasUnoptimized[group],
            funCounter[group]
        );
        gasUnoptimized[group] = unoptimizedGas;
        funCounter[group] = counter;
    }

    modifier optimized(string memory group) {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        (uint256 unoptimizedGas, uint256 counter) = GUnit.gFlask(
            true,
            startGas - endGas,
            gasUnoptimized[group],
            funCounter[group]
        );
        gasUnoptimized[group] = unoptimizedGas;
        funCounter[group] = counter;
    }
}
