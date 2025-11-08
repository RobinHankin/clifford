# Low-level helper functions for `clifford` objects

Helper functions for `clifford` objects, written in `C` using the `STL`
map class.

## Usage

``` r
c_identity(L, p, m)
c_grade(L, c, m, n)
c_add(L1, c1, L2, c2, m)
c_multiply(L1, c1, L2, c2, m, sig)
c_power(L, c, m, p, sig)
c_equal(L1, c1, L2, c2, m)
c_overwrite(L1, c1, L2, c2, m)
c_cartan(L, c, m, n)
c_cartan_inverse(L, c, m, n)
```

## Arguments

- L, L1, L2:

  Lists of terms

- c1, c2, c:

  Numeric vectors of coefficients

- m:

  Maximum entry of terms

- n:

  Grade to extract

- p:

  Integer power

- sig:

  Two positive integers, \\p\\ and \\q\\, representing the number of
  \\+1\\ and \\-1\\ terms on the main diagonal of quadratic form

## Details

The functions documented here are low-level helper functions that wrap
the `C` code. They are called by functions like
[`clifford_plus_clifford()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md),
which are themselves called by the binary operators documented at
`Ops.clifford.Rd`. The functions documented here are not really intended
for day-to-day use.

Function `c_identity()` checks that the list of terms `L` is the same
length as the vector coefficients `p`; if not, an error is given. Note
that R function
[`clifford()`](https://robinhankin.github.io/clifford/reference/clifford.md)
will recycle the coefficient vector if of length 1, so that
`clifford(list(1,1:2),7)` works as expected (but
`c_identity(list(1,1:2),7,2)` will throw an error).

Function
[`clifford_inverse()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)
is problematic as nonnull blades always have an inverse; but function
[`is.blade()`](https://robinhankin.github.io/clifford/reference/term.md)
is not yet implemented. Blades (including null blades) have a
pseudoinverse, but this is not implemented yet either.

## Value

The high-level functions documented here return an object of class
`clifford`. But don't use the low-level functions.

## Author

Robin K. S. Hankin

## See also

[`Ops.clifford`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)
