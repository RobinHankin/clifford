# Horner's method

Horner's method for Clifford objects

## Usage

``` r
horner(P, v)
```

## Arguments

- P:

  A Clifford object

- v:

  Numeric vector of coefficients

## Details

Given a polynomial

\$\$p(x) = a_0 +a_1+a_2x^2+\cdots + a_nx^n\$\$

it is possible to express \\p(x)\\ in the algebraically equivalent form

\$\$p(x) = a_0 + x\left(a_1+x\left(a_2+\cdots + x\left(a\_{n-1} +xa_n
\right)\cdots\right)\right)\$\$

which is much more efficient for evaluation, as it requires only \\n\\
multiplications and \\n\\ additions, and this is optimal. The output of
`horner()` depends on the
[`signature()`](https://robinhankin.github.io/clifford/reference/signature.md).

## Author

Robin K. S. Hankin

## Note

Horner's method is not as cool for Clifford objects as it is for (e.g.)
multivariate polynomials or `freealg` objects. This is because powers of
Clifford objects don't get more complicated as the power increases.

## Examples

``` r
horner(1 + e(1:3) + e(2:3), 1:6)
#> Element of a Clifford algebra, equal to
#> + 511 + 490e_1 + 502e_23 + 502e_123

rcliff() |> horner(1:4)
#> Element of a Clifford algebra, equal to
#> + 4960 - 1364e_1 - 4774e_13 - 5370e_5 - 560e_35 + 5250e_135 + 4774e_16 +
#> 5530e_26 - 1500e_126 + 5250e_1236 - 4424e_46 + 1200e_146 - 3222e_246 +
#> 4200e_1346 + 336e_2346 - 3150e_12346 + 1840e_56 - 462e_156 + 8046e_256 -
#> 896e_1356 - 448e_2356 + 8400e_12356 - 3000e_456 + 3360e_13456
```
