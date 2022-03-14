# 🧪 Optimizooor's Lab

**Welcome to the 🧪 Optimizooor's Lab!**

Optimize code and run tests with our equipment for optimizooors:
- **[`MyLab`](src/MyLab.sol)**: An environment for running controlled experiments
- **[`GFlask`](src/GFlask.sol)**: An instrument for measuring gas savings with different optimizations

## Findings

```solidity
// Given code:
i += 1;

++i;
// SAVES (GAS): 3

i = i + 1;
// No savings.

i++;
// [!] More expensive (gas): -2
```

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