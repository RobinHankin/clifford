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
#> + 12160 - 3156e_1 + 10800e_13 - 13968e_24 + 2400e_124 + 14202e_1234 + 8904e_5 -
#> 5490e_25 + 1500e_125 + 6912e_135 + 2880e_1235 - 4800e_245 - 720e_345 -
#> 576e_2345 + 5400e_12345 - 11046e_16 + 9660e_36 - 1800e_136 - 1714e_236 +
#> 144e_46 - 1350e_146 + 864e_246 + 8400e_1246 - 128e_1346 + 7200e_2346 -
#> 2304e_12346 - 448e_56 + 4200e_156 + 5250e_1256 - 3600e_356 - 80e_1356 +
#> 4500e_2356 - 1440e_12356 + 2160e_1456 - 5736e_12456 - 2264e_3456 - 4608e_23456
```
