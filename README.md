# fast ocaml fib

> An Implementation of fibonacci using the Zarith Library

## Summary

This small project contains three different implementations of Fibonacci in Ocaml.

1. Recursive: The typical (slow) implementation of Fibonacci
2. Memoization: The recursive implementation but optimized with Memoization
3. Iterative/tail-recursive: The iterative implementation (done with tail-recursion)

## Zarith

I wanted to tryout the Zarith Library to compute big int fibonacci numbers. Therefore Zarith is needed for execution.

## Usage

To compute Fibonacci numbers with this Program you just need to run the following commands:

```[bash]
dune _build
./_build/default/main.exe arg_n
```

Which calculates the nth Fibonacci numbers. Alternatively you can run:

```
duen exec fast_ocaml_fib arg_n
```

### Installing Zarith

In case you haven't installed Zarith before you will have to run:

```
opam install -y zarith
```

## Contributions

Contributions or corrections are appreciated, but please follow these steps:

- write an Issue
- fork the Repo
- Add your changes
- Request a PR
- Wait for approval

That makes it much easier for to collaborate. You can also just write an Issue if you have found a bug.
