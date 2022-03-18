# 🧪 Optimizooor's Lab

**Welcome to the 🧪 Optimizooor's Lab!**

Optimize code and run tests with our equipment for optimizooors:
- **[`MyLab`](#template-usage)**: An environment for running controlled experiments
- **[`GFlask`](#gflask-usage)**: An instrument for measuring gas savings with different optimizations

The lab runs natively in Solidity and is framework-agnostic.

## Findings

```text
Running 1 test for MyLab.json:MyLab
[PASS] test() (gas: 510664)
Logs:
  Increment `i += 1`
  
  Use `++i` instead
  SAVES (GAS): 3
  
  Try using `i = i + 1`
  No savings.
  
  Try using `i++`
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

**Note:** Run `forge install` afterward to install `DSTest`.

... or install as a dependency

```bash
forge install https://github.com/ZeroEkkusu/optimizooors-lab
```

### Template usage

To use [`MyLab`](src/biohazard/MyLab.sol), provide code samples in [`Samples.sol`](src/Samples.sol):

```solidity
contract Sample0 is SharedSetup {
    function measureGas() external {
        uint i;
        i++;
    }
}

contract Sample1 is SharedSetup {
    function measureGas() external {
        uint i;
        ++i;
    }
}
```

**Note:** For more complex setups, use [`SharedSetup`](src/Samples.sol) to minimize boilerplate.

Run `forge test` to compare all provided samples against `Sample0`:

```console
00x@ubuntu:~$ forge test
SAVES (GAS): 5
```

It is possible to customize the console output with [`Labels`](src/Samples.sol):

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

Let's run `forge test` again:

```console
00x@ubuntu:~$ forge test
Increment `i++`

Use `++i` instead
SAVES (GAS): 5
```

**Note:** Combine with other commands at your disposal for more power. You can run `forge test --gas-report` to print the absolute gas costs as well.

> `Samples.sol` files are easy to share with others!
>
> Try copy-pasting their contents to another system and they'll work out of the box. No setup required.

### GFlask usage

To use [`GFlask`](src/biohazard/GFlask.sol) in your project, mark the function with unoptimized code as `unoptimized` and the ones with optimized code as `optimized`.

It is possible to customize the console output with labels. In the example below, we left them unlabeled (`""`).

Then, call all the functions inside one `test` function, first calling the `unoptimized` function:

```solidity
import "optimizooors-lab/biohazard/GFlask.sol"

contract Increment is GFlask {
    function iPlusPlus() public unoptimized("") {
        uint i;
        i++;
    }

    function plusPlusI() public optimized("") {
        uint i;
        ++i;
    }

    function testIncrement() {
        iPlusPlus();
        plusPlusI()
    }
}
```

After running `forge test`, you get the following output:

```console
00x@ubuntu:~$ forge test
SAVES (GAS): 5
```

**Note:** Combine with other commands at your disposal for more power. You can run `forge test --gas-report` to print the absolute gas costs as well.

<br>

**Thank you for visiting the 🧪 Optimizooor's Lab!**

Measuring gas savings can be tricky sometimes.

It is useful to have basic knowledge of how the optimizer works, so you can isolate the code properly.

E.g. If you stored `i` in storage instead of memory in the example above, the gas numbers would be incorrect!

Visit [**⛳ Re:Golf Course**](https://github.com/ZeroEkkusu/re-golf-course) to learn more about this and other common optimizations.