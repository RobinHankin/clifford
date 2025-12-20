# Magnitude of a clifford object

Following Perwass, the magnitude of a multivector is defined as

\$\$\left\|\left\|A\right\|\right\| = \sqrt{A\ast A}\$\$

Where \\A\ast A\\ denotes the Euclidean scalar product
[`eucprod()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md).

## Usage

``` r
# S3 method for class 'clifford'
Mod(z)
```

## Arguments

- z:

  Clifford objects

## Author

Robin K. S. Hankin

## Details

For any multivector \\A\\, the Euclidean scalar product \\A\ast A\\ is
never negative, so the square root is always defined.

The function body of `Mod.clifford()` is `sqrt(abs(eucprod(z)))`; the
[`abs()`](https://rdrr.io/r/base/MathFun.html) is needed to avoid
numerical roundoff errors in
[`eucprod()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)
giving a negative value.

## Note

If you want the square, \\\left\|\left\|A\right\|\right\|^2\\ and not
\\\left\|\left\|A\right\|\right\|\\, it is faster and more accurate to
use `eucprod(A)` \[rather than `Mod(A)^2`\], because this avoids a
needless square root.

There is a nice example of scalar product at `rcliff.Rd`.

## See also

[`Ops.clifford`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md),
[`Conj`](https://robinhankin.github.io/clifford/reference/involution.md),
[`rcliff`](https://robinhankin.github.io/clifford/reference/rcliff.md)

## Examples

``` r

Mod(rcliff())
#> [1] 12.24745


# Perwass, p68, asserts that if A is a k-blade, then (in his notation)
# AA == A*A.

# In package idiom, A*A == A %star% A:

A <- rcliff()          
Mod(A*A - A %star% A)  # meh
#> [1] 82.19489

A <- rblade()
Mod(A*A - A %star% A)  # should be small
#> [1] 0
```
