# Zap small values in a clifford object

Generic version of `zapsmall()`

## Usage

``` r
zap(x, drop=TRUE, digits = getOption("digits"))
```

## Arguments

- x:

  Clifford object

- drop:

  Boolean with default `TRUE` meaning to coerce the output to numeric
  with
  [`drop()`](https://robinhankin.github.io/clifford/reference/drop.md)

- digits:

  number of digits to retain

## Details

Given a clifford object, coefficients close to zero are ‘zapped’, i.e.,
replaced by ‘0’ in much the same way as
[`base::zapsmall()`](https://rdrr.io/r/base/zapsmall.html).

The function should be called `zapsmall()`, and dispatch to the
appropriate base function, but I could not figure out how to do this
with S3 (the docs were singularly unhelpful) and gave up.

Note, this function actually changes the numeric value, it is not just a
print method.

## Author

Robin K. S. Hankin

## Examples

``` r
a <- clifford(sapply(1:10,seq_len), 90^-(1:10))
zap(a)
#> Element of a Clifford algebra, equal to
#> + 0.01111111e_1 + 0.000123457e_12 + 1.372e-06e_123 + 1.5e-08e_1234
options(digits=3)
zap(a)
#> Element of a Clifford algebra, equal to
#> + 0.0111e_1 + 0.00012e_12


a - zap(a)   # nonzero
#> Element of a Clifford algebra, equal to
#> + 1.11e-06e_1 + 3.46e-06e_12 + 1.37e-06e_123 + 1.52e-08e_1234 + 1.69e-10e_12345
#> + 1.88e-12e_123456 + 2.09e-14e_1234567 + 2.32e-16e_12345678 +
#> 2.58e-18e_123456789 + 2.87e-20e_12345678910

B <- rblade(g=3)
mB <- B*rev(B)
zap(mB)
#> [1] 47379
drop(mB)
#> [1] 47379
```
