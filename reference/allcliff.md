# Clifford object containing all possible terms

The Clifford algebra on basis vectors \\e_1,e_2,\ldots, e_n\\ has
\\2^n\\ independent multivectors. Function `allcliff()` generates a
clifford object with a nonzero coefficient for each multivector.

## Usage

``` r
allcliff(n,grade)
```

## Arguments

- n:

  Integer specifying dimension of underlying vector space

- grade:

  Grade of multivector to be returned. If missing, multivector contains
  every term of every grade \\\leq n\\

## Author

Robin K. S. Hankin

## Examples

``` r
allcliff(6)
#> Element of a Clifford algebra, equal to
#> + 1 + 1e_1 + 1e_2 + 1e_12 + 1e_3 + 1e_13 + 1e_23 + 1e_123 + 1e_4 + 1e_14 +
#> 1e_24 + 1e_124 + 1e_34 + 1e_134 + 1e_234 + 1e_1234 + 1e_5 + 1e_15 + 1e_25 +
#> 1e_125 + 1e_35 + 1e_135 + 1e_235 + 1e_1235 + 1e_45 + 1e_145 + 1e_245 + 1e_1245
#> + 1e_345 + 1e_1345 + 1e_2345 + 1e_12345 + 1e_6 + 1e_16 + 1e_26 + 1e_126 + 1e_36
#> + 1e_136 + 1e_236 + 1e_1236 + 1e_46 + 1e_146 + 1e_246 + 1e_1246 + 1e_346 +
#> 1e_1346 + 1e_2346 + 1e_12346 + 1e_56 + 1e_156 + 1e_256 + 1e_1256 + 1e_356 +
#> 1e_1356 + 1e_2356 + 1e_12356 + 1e_456 + 1e_1456 + 1e_2456 + 1e_12456 + 1e_3456
#> + 1e_13456 + 1e_23456 + 1e_123456

a <- allcliff(5)
a[] <- rcliff()*100
```
