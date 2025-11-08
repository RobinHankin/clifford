# Even and odd clifford objects

A clifford object is *even* if every term has even grade, and *odd* if
every term has odd grade.

Functions `is.even()` and `is.odd()` test a clifford object for evenness
or oddness.

Functions `evenpart()` and `oddpart()` extract the even or odd terms
from a clifford object, and we write \\A\_+\\ and \\A\_-\\ respectively;
we have \\A=A\_+ + A\_-\\

## Usage

``` r
is.even(C)
is.odd(C)
evenpart(C)
oddpart(C)
```

## Arguments

- C:

  Clifford object

## Author

Robin K. S. Hankin

## See also

[`grade`](https://robinhankin.github.io/clifford/reference/grade.md)

## Examples

``` r
A <- rcliff()
A == evenpart(A) + oddpart(A) # should be true
#> [1] TRUE
```
