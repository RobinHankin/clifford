# Drop redundant information

Coerce scalar Clifford objects to numeric

## Usage

``` r
drop(x)
drop_clifford(x)
```

## Arguments

- x:

  Clifford object

## Details

If its argument is a pure scalar clifford object, or the pseudoscalar,
coerce to numeric. Scalar or pseudoscalar clifford objects are coerced
to an *unnamed* numeric vector (of length 1). Checking for being the
pseudoscalar requires that option `maxdim` be set.

Function `drop()` is generic, dispatching to helper function
`drop_clifford()` for clifford objects. The logic of `drop_clifford()`
prevents
[`is.pseudoscalar()`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)
being called if `maxdim` is `NULL`.

## Author

Robin K. S. Hankin

## See also

[`const`](https://robinhankin.github.io/clifford/reference/const.md),[`pseudoscalar`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)

## Note

Many functions in the package take `drop` as an argument which, if
`TRUE`, means that the function returns a `drop`ped value.

## Examples

``` r
drop(as.clifford(5))
#> [1] 5

const(rcliff())
#> [1] 6
const(rcliff(),drop=FALSE)
#> Element of a Clifford algebra, equal to
#> scalar ( 7 )
```
