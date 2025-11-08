# The zero Clifford object

Dealing with the zero Clifford object presents particular challenges.
Some of the methods need special dispensation for the zero object.

## Usage

``` r
is.zero(x)
```

## Arguments

- x:

  Clifford object

## Details

To test for a Clifford object's being zero, use `is.zero()`. Idiom such
as `x==0` will work irregardless, but sometimes one might prefer the
functional form for stylistic reasons.

To create the zero object *ab initio*, use

`clifford(list(),numeric(0))`

although note that `scalar(0)` will work too.

## Author

Robin K. S. Hankin

## Note

The coefficient of the zero clifford object, as in `coeff(scalar(0))`,
is `numeric(0)` (but note that `1 + NULL` also returns `numeric(0)`).

Function `is.zero()` is problematic if another package which also has an
`is.zero()` generic is loaded, for this will mask `clifford::is.zero()`.
Specifically, the [jordan](https://CRAN.R-project.org/package=jordan)
package includes
[`jordan::is.zero()`](https://rdrr.io/pkg/jordan/man/zero.html) and the
two do not play nicely together.

## See also

[`scalar`](https://robinhankin.github.io/clifford/reference/numeric_to_clifford.md)

## Examples

``` r
is.zero(rcliff())
#> [1] FALSE
```
