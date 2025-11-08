# Coercion from numeric to Clifford form

Given a numeric value or vector, return a Clifford algebra element

## Usage

``` r
pseudoscalar()
is.pseudoscalar(C)
```

## Arguments

- C:

  Object possibly of class Clifford

## Details

Function `pseudoscalar()` returns the unit pseudoscalar of
dimensionality `option("maxdim")` and function `is.pseudoscalar()`
checks for a Clifford object being a pseudoscalar. Note that these
functions *require* `maxdim` to be set; otherwise they are meaningless.

Usually, one will set `option(maxdim)` at the start of a session,
together with the signature. Then one might define `I <- pseudoscalar()`
in the interests of compactness and legibility.

## Author

Robin K. S. Hankin

## See also

[`getcoeffs`](https://robinhankin.github.io/clifford/reference/Extract.md),[`numeric_to_clifford`](https://robinhankin.github.io/clifford/reference/numeric_to_clifford.md),[`const`](https://robinhankin.github.io/clifford/reference/const.md)

## Examples

``` r
options(maxdim=6)
I <- pseudoscalar()
is.pseudoscalar(I)
#> [1] TRUE
options(maxdim=NULL) # restore default
```
