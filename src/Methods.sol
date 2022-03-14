// SPDX-License-Identifier: Unlicense

/*

    |////////////////////////////|
    |  ⚠️ WARNING  [ BIOHAZARD ]  |
    | -------------------------- |
    | Authorized personnel only. |
    |////////////////////////////|

*/

contract Methods {
    /// @notice Prevent the optimizer
    /// @notice from inlining functions
    function doSomething() internal pure {
        uint256 smth;
        smth++;
    }
}
