# Homogenous Clifford objects

A clifford object is homogenous if all its terms are the same grade. A
scalar (including the zero clifford object) is considered to be
homogenous. This ensures that `is.homog(grade(C,n))` always returns
`TRUE`.

## Usage

``` r
is.homog(C)
```

## Arguments

- C:

  Object of class clifford

## Note

Nonzero homogenous clifford objects have a multiplicative inverse.

## Author

Robin K. S. Hankin

## Examples

``` r
is.homog(rcliff())
#> [1] FALSE
is.homog(rcliff(include.fewer=FALSE))
#> [1] TRUE
```
