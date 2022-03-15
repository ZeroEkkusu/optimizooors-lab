# 🧪 Optimizooor's Lab

**Welcome to the 🧪 Optimizooor's Lab!**

Optimize code and run tests with our equipment for optimizooors:
- **[`MyLab`](src/biohazard/MyLab.sol)**: An environment for running controlled experiments
- **[`GFlask`](src/biohazard/GFlask.sol)**: An instrument for measuring gas savings with different optimizations

## Findings

```text
Running 1 test for MyLab.json:MyLab
[PASS] test() (gas: 510664)
Logs:
  Increment `i += 1`
  
  Use `++i` instead
  SAVES (GAS): 3
  
  `i = i + 1`
  No savings.
  
  `i++`
  [!] More expensive (gas): -2
```

## Research

### [**⛳ Re:Golf Course**](https://github.com/ZeroEkkusu/re-golf-course)

A list of common Solidity optimization tips and myths.

## Instructions

Download `foundryup`

```bash
curl -L https://foundry.paradigm.xyz | bash
```

Install Foundry

```bash
foundryup
```

Create a new project using our template

```bash
forge init --template https://github.com/ZeroEkkusu/optimizooors-lab my_lab
```

... or install as a dependency

```bash
forge install https://github.com/ZeroEkkusu/optimizooors-lab
```

### Template usage

To use [`MyLab`](src/biohazard/MyLab.sol), provide code samples in [`Samples.sol`](src/Samples.sol):

```solidity
contract Sample0 is SharedSetup {
    function unoptimized() public {
        uint i;
        i++;
    }
}

contract Sample1 is SharedSetup {
    function optimized() public {
        uint i;
        ++i;
    }
}
```

For more complex setups, use [`SharedSetup`](src/Samples.sol) to minimize boilerplate.

Run `forge test` to compare all provided samples against `Sample0`:

```console
00x@ubuntu:~$ forge test
SAVES (GAS): 5
```

It is possible to customize the console output with [`Labels`](src/Samples.sol) to create a shareable format:

```solidity
abstract contract Labels {
    string label0 = "Increment `i++`";
    string label1 = "Use `++i` instead";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}
```

Let's run `forge test` now:

```console
00x@ubuntu:~$ forge test
Increment `i++`

Use `++i` instead
SAVES (GAS): 5
```

You can use [`doSomething()`](src/biohazard/Methods.sol) as a placeholder whenever you need to prevent the optimizer from inlining your function, instead of writing meaningless code:

```solidity
contract Sample0 is SharedSetup {
    function unoptimized() public {
        doSomething();
    }
}

contract Sample1 is SharedSetup {
    function optimized() public payable {
        doSomething();
    }
}
```

`Samples.sol` files are easy to share with others!

Try copy-pasting their contents to another system and they'll work out of the box. No setup required.

### GFlask usage

To use [`GFlask`](src/biohazard/GFlask.sol) in your project, mark the function with unoptimized code as `unoptimized` and all the others you want to compare as `optimized`. You may leave them unlabeled (`""`). Call all of them inside a `test` function, first calling the unoptimized function:

```solidity
import "optimizooors-lab/biohazard/GFlask.sol"

contract YourContract {
    function iPlusPlus() internal unoptimized("") {
        uint i;
        i++;
    }

    function plusPlusI() internal optimized("") {
        uint i;
        ++i;
    }

    function testIncrement() {
        iPlusPlus();
        plusPlusI()
    }
}
```

Measuring gas savings can be tricky sometimes!

It is useful to have basic knowledge of how the optimizer works, so you can isolate the code properly.

E.g. If you stored `i` in storage instead of memory in the example above, the gas numbers would be incorrect.

Visit [**⛳ Re:Golf Course**](https://github.com/ZeroEkkusu/re-golf-course) to learn more about this and other common optimizations.