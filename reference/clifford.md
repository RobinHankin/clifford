# Create, coerce, and test for `clifford` objects

An object of class `clifford` is a member of a Clifford algebra. These
objects may be added and multiplied, and have various applications in
physics and mathematics.

## Usage

``` r
clifford(terms, coeffs=1)
is_ok_clifford(terms, coeffs)
as.clifford(x)
is.clifford(x)
nbits(x)
nterms(x)
# S3 method for class 'clifford'
dim(x)
```

## Arguments

- terms:

  A list of integer vectors with strictly increasing entries
  corresponding to the basis vectors of the underlying vector space

- coeffs:

  Numeric vector of coefficients

- x:

  Object of class `clifford`

## Details

- Function `clifford()` is the formal creation mechanism for `clifford`
  objects. If `coeffs` is of length 1, it will be recycled (even if
  `terms` is empty, in which case the zero Clifford object is returned).
  Argument `terms` is passed through
  [`list_modifier()`](https://robinhankin.github.io/clifford/reference/Extract.md),
  so a zero entry is interpreted as `numeric(0)`

- Function `as.clifford()` is much more user-friendly and attempts to
  coerce a range of input arguments to clifford form

- Function `nbits()` returns the number of bits required in the
  low-level C routines to store the terms (this is the largest entry in
  the list of terms). For a scalar, this is zero and for the zero
  clifford object it (currently) returns zero as well although a case
  could be made for `NULL`

- Function `nterms()` returns the number of terms in the expression

- Function `is_ok_clifford()` is a helper function that checks for
  consistency of its arguments

## References

Snygg 2012. “A new approach to differential geometry using Clifford's
geometric algebra”. Birkhauser; Springer Science+Business.

## Author

Robin K. S. Hankin

## See also

[`Ops.clifford`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)

## Examples

``` r
(x <- clifford(list(1,2,1:4),1:3))   # Formal creation method
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 2e_2 + 3e_1234
(y <- as.1vector(4:2))
#> Element of a Clifford algebra, equal to
#> + 4e_1 + 3e_2 + 2e_3
(z <- rcliff(include.fewer=TRUE))
#> Element of a Clifford algebra, equal to
#> + 6 - 3e_3 - 8e_25 + 2e_125 + 9e_45 + 6e_2345 - 6e_6 + 4e_2346 + 8e_456 +
#> 1e_1456

terms(x+100)
#> A disord object with hash 44041cf8cc66f11ef3ad34a2b8596d11d2abe80a and elements
#> [[1]]
#> integer(0)
#> 
#> [[2]]
#> [1] 1
#> 
#> [[3]]
#> [1] 2
#> 
#> [[4]]
#> [1] 1 2 3 4
#> 
#> (in some order)
coeffs(z)
#> A disord object with hash eab31f0bdabf8c45bd98dfa9fadfed85c1a59067 and elements
#>  [1]  6 -3 -8  2  9  6 -6  4  8  1
#> (in some order)

## Clifford objects may be added and multiplied:

x + y
#> Element of a Clifford algebra, equal to
#> + 5e_1 + 5e_2 + 2e_3 + 3e_1234
x*y
#> Element of a Clifford algebra, equal to
#> + 10 - 5e_12 + 2e_13 + 4e_23 - 6e_124 + 9e_134 - 12e_234
```
