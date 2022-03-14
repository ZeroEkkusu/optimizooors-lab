// SPDX-License-Identifier: Unlicense

/*

    |////////////////////////////|
    |  ⚠️ WARNING  [ BIOHAZARD ]  |
    | -------------------------- |
    | Authorized personnel only. |
    |////////////////////////////|

*/

import "src/Samples.sol";
import "src/GFlask.sol";

contract MyLab is GFlask {
    function run(Sample0 s0) public unoptimized {
        s0.unoptimized();
    }

    // ------------------------------------------

    function run1(Sample1 s1) public optimized {
        s1.optimized();
    }

    function run2(Sample2 s2) public optimized {
        s2.optimized();
    }

    function run3(Sample3 s3) public optimized {
        s3.optimized();
    }

    function run4(Sample4 s4) public optimized {
        s4.optimized();
    }

    function run5(Sample5 s5) public optimized {
        s5.optimized();
    }

    function test() public {
        measureEmpty();
        run(new Sample0());
        run1(new Sample1());
        run2(new Sample2());
        run3(new Sample3());
        run4(new Sample4());
        run5(new Sample5());
    }
}
