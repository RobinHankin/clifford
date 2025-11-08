# Summary methods for clifford objects

Summary method for clifford objects, and a print method for summaries.

## Usage

``` r
# S3 method for class 'clifford'
summary(object, ...)
# S3 method for class 'summary.clifford'
print(x, ...)
first_n_last(x)
```

## Arguments

- object,x:

  Object of class clifford

- ...:

  Further arguments, currently ignored

## Details

Summary of a clifford object. Note carefully that the “typical terms”
are implementation specific. Function `first_n_last()` is a helper
function.

## Author

Robin K. S. Hankin

## See also

[`print`](https://rdrr.io/r/base/print.html)

## Examples

``` r
summary(rcliff())
#> Element of a Clifford algebra 
#> Typical terms:  6  ...  + 8e_2356 
#> Number of terms: 9 
#> Magnitude: 290 
```
