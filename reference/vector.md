# Coerce a clifford vector to a numeric vector

Given a clifford object with all terms of grade 1, return the
corresponding numeric vector

## Usage

``` r
# S3 method for class 'clifford'
as.vector(x, mode = "any")
```

## Arguments

- x:

  Object of class clifford

- mode:

  ignored

## Author

Robin K. S. Hankin

## Note

The awkward R idiom of this function is because the terms may be stored
in any order; see the examples

## See also

[`numeric_to_clifford`](https://robinhankin.github.io/clifford/reference/numeric_to_clifford.md)

## Examples

``` r
x <- clifford(list(6,2,9), 1:3)
as.vector(x)
#> [1] 0 2 0 0 0 1 0 0 3

as.1vector(as.vector(x)) == x  # should be TRUE
#> [1] TRUE
```
