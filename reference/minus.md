# Take the negative of a vector

Very simple function that takes the negative of a vector.

## Usage

``` r
minus(x)
```

## Arguments

- x:

  Clifford object

## Details

This trivial function is here so that idiom such as

    coeffs(z)[gradesminus(z)%%2 != 0] %<>% minus

works as intended (this taken from
[`Conj.clifford()`](https://robinhankin.github.io/clifford/reference/involution.md)).
Most of the functions in `R/involutions.R` use `minus()`.

## Value

Returns a clifford object

## Author

Robin K. S. Hankin

## See also

[`involution`](https://robinhankin.github.io/clifford/reference/involution.md)

## Examples

``` r

x <- rcliff()
minus(x)
#> Element of a Clifford algebra, equal to
#> - 6 + 5e_135 - 2e_145 + 3e_2345 + 9e_6 - 5e_16 + 2e_246 - 8e_456 + 6e_3456
```
