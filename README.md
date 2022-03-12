# 🧪 Optimizooor's Lab

**Welcome to the 🧪 Optimizooor's Lab!**

Optimize code and run tests with our equipment for optimizooors:
- **[`GFlask`](src/GFlask.sol)**: An instrument for measuring gas savings with different optimizations
- **[`MyLab`](src/MyLab.sol)**: An environment for running controlled experiments

## Findings

```solidity
function unoptimized0() public unoptimized {
    uint256 i;
    i += 1;
}

// -----------------------------------------

function optimized1() public optimized {
    uint256 i;
    ++i;
}

function optimized2() public optimized {
    uint256 i;
    i = i + 1;
}

function optimized3() public optimized {
    uint256 i;
    i++;
}
```

```text
  ::: 1
  SAVES (GAS): 3
  PERCENT (%): 3.33
  
  ::: 2
  No savings.
  
  ::: 3
  [!] More expensive (gas): -2
```

## Proof-of-concept

### [**⛳ Re:Golf Course**](https://github.com/ZeroEkkusu/re-golf-course)

Proof-of-concept Golf Course reimagined with our `GFlask` and a golf theme.

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