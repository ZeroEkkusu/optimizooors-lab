// SPDX-License-Identifier: Unlicense

/*

    |////////////////////////////|
    |  ⚠️ WARNING  [ BIOHAZARD ]  |
    | -------------------------- |
    | Authorized personnel only. |
    |////////////////////////////|

*/

import "src/Samples.sol";
import "src/biohazard/GFlask.sol";

contract MyLab is GFlask, Labels {
    function run0(Sample0 sample0) public unoptimized(label0) {
        sample0.measureGas();
    }

    function run1(Sample1 sample1) public optimized(label1) {
        sample1.measureGas();
    }

    function run2(Sample2 sample2) public optimized(label2) {
        sample2.measureGas();
    }

    function run3(Sample3 sample3) public optimized(label3) {
        sample3.measureGas();
    }

    function run4(Sample4 sample4) public optimized(label4) {
        sample4.measureGas();
    }

    function run5(Sample5 sample5) public optimized(label5) {
        sample5.measureGas();
    }

    function test() external {
        run0(new Sample0());
        run1(new Sample1());
        run2(new Sample2());
        run3(new Sample3());
        run4(new Sample4());
        run5(new Sample5());
    }
}
