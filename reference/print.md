# Print clifford objects

Print methods for Clifford algebra

## Usage

``` r
# S3 method for class 'clifford'
print(x,...)
# S3 method for class 'clifford'
as.character(x,...)
catterm(a)
```

## Arguments

- x:

  Object of class `clifford` in the print method

- ...:

  Further arguments, currently ignored

- a:

  Integer vector representing a term

## Author

Robin K. S. Hankin

## Note

The print method does not change the internal representation of a
`clifford` object, which is a two-element list, the first of which is a
list of integer vectors representing terms, and the second is a numeric
vector of coefficients. The print method has special dispensation for
the zero clifford object.

The print method is sensitive to the value of options `separate` and
`basissep`. If option `separate` is `FALSE` (the default), the method
prints the basis blades in a compact form, as in “`e_134`”. The indices
of the basis vectors are separated with the value of option `basissep`
which is usually `NULL`; but if \\n\>9\\, then setting option `basissep`
to a comma (“`,`”) might look good as it will print `e_10,11,12` instead
of `e_101112`:

    options("basissep" = ",")

If option `separate` is `TRUE`, the method prints the basis vectors
separately, as in `e10 e11 e12`:

    options("separate" = TRUE)

Function `catterm()` is a low-level helper function, used in the print
method, coercion to character, and also in function
[`getcoeffs()`](https://robinhankin.github.io/clifford/reference/Extract.md)
to set the names of its output. It takes an integer vector like
`c(1,5,6)` and returns a representation of the corresponding basis
blade, in this case “`e_156`”. Function `catterm()` is where options
`basissep` and `separate` are processed. Special dispensation is needed
for length-zero vectors, for which the empty string is returned. This is
needed to ensure that the constant term (which has a basis blade of
`numeric(0)`) is treated appropriately. See also
[`list_modifier()`](https://robinhankin.github.io/clifford/reference/Extract.md)
which deals with this issue.

The prompt can be changed to show the signature and this is documented
at `signature`.

Experimental bespoke print method `print_clifford_quaternion()` is
included. This is executed if option `clifford_print_special` is
`quaternion`; if `NULL`, then `print_clifford_default()` is used. It is
straightforward to add further bespoke print methods if needed (modify
`print.clifford()`; it might be nice to have `clifford_print_pauli()` at
some point).

## See also

[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md),[`signature`](https://robinhankin.github.io/clifford/reference/signature.md)

## Examples

``` r
a <- rclifff(9)
a   # default print method incomprehensible
#> Element of a Clifford algebra, equal to
#> + 6 + 5e_12 - 5e_512 + 6e_6791518 - 9e_34691214161719 + 1e_25101214171820 -
#> 2e_124510111920 - 6e_6781213151920 - 3e_24578911161920 + 7e_15610111415171920

options("separate" = TRUE)
a    # marginally better
#> Element of a Clifford algebra, equal to
#> + 6 + 5e12 - 5e5 e12 + 6e6 e7 e9 e15 e18 - 9e3 e4 e6 e9 e12 e14 e16 e17 e19 +
#> 1e2 e5 e10 e12 e14 e17 e18 e20 - 2e1 e2 e4 e5 e10 e11 e19 e20 - 6e6 e7 e8 e12
#> e13 e15 e19 e20 - 3e2 e4 e5 e7 e8 e9 e11 e16 e19 e20 + 7e1 e5 e6 e10 e11 e14
#> e15 e17 e19 e20


options("separate" = FALSE)
options(basissep=",")
a    #  clearer; YMMV
#> Element of a Clifford algebra, equal to
#> + 6 + 5e_12 - 5e_5,12 + 6e_6,7,9,15,18 - 9e_3,4,6,9,12,14,16,17,19 +
#> 1e_2,5,10,12,14,17,18,20 - 2e_1,2,4,5,10,11,19,20 - 6e_6,7,8,12,13,15,19,20 -
#> 3e_2,4,5,7,8,9,11,16,19,20 + 7e_1,5,6,10,11,14,15,17,19,20

options(basissep = NULL, maxdim=NULL)  # restore default

options("maxdim" = 3)
signature(3)
a <- clifford(list(0,c(1,2),c(1,3),c(2,3)), 6:9)
a
#> Element of a Clifford algebra, equal to
#> + 6 + 7e_12 + 8e_13 + 9e_23

options("clifford_print_special" = "quaternion")
a
#> A quaternion equal to: 
#> +6 -7i -8j -9k

options("maxdim" = NULL)
options("clifford_print_special" = NULL)
signature(Inf)
```
