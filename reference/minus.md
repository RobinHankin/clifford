# Take the negative of a vector

Very simple function that takes the negative of a vector, here so that
idiom such as

`coeffs(z)[gradesminus(z)%%2 != 0] %<>% minus`

works as intended (this taken from
[`Conj.clifford()`](https://robinhankin.github.io/clifford/reference/involution.md)).

## Usage

``` r
minus(x)
```

## Value

Returns a vector or disord

## Arguments

- x:

  Any vector or disord object

## Author

Robin K. S. Hankin
