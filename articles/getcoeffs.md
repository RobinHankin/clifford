# Function \`getcoeffs()\` in the \`clifford\` package

![](../../../_temp/Library/clifford/help/figures/clifford.png)

``` r
getcoeffs
```

    ## function (C, B) 
    ## {
    ##     out <- c_getcoeffs(L = terms(C), c = coeffs(C), m = maxyterm(C), 
    ##         B = list_modifier(B))
    ##     names(out) <- lapply(B, catterm)
    ##     return(out)
    ## }

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document discusses
function
[`getcoeffs()`](https://robinhankin.github.io/clifford/reference/Extract.md)
in the `clifford` R package which, as its name suggests, retrieves
specific coefficients from a clifford object. It is a relatively
low-level helper function that is a wrapper for a `C` routine. It takes
as arguments a clifford object and a list of terms:

``` r
set.seed(0)
(a <- rcliff())
```

    ## Element of a Clifford algebra, equal to
    ## + 5 + 6e_1 - 9e_12 - 3e_14 + 3e_26 - 6e_126 + 1e_236 - 1e_56 + 4e_156

``` r
getcoeffs(a,list(1:2, 0, c(2,5), c(1,5,6), c(2,6), 1:2))
```

    ##  e_12   e_0  e_25 e_156  e_26  e_12 
    ##    -9     5     0     4     3    -9

Note that the first and last element of the returned vector are both the
coefficient of \\e\_{12}\\, *viz.* `-9`. The coefficients are returned
in the form of a numeric vector \[not a `disord` object: the order of
the elements is determined by the order of argument `B`\]. Compare
standard extraction, e.g. `a[index]`, which returns a `clifford` object.
Also, compare
[`coeffs()`](https://robinhankin.github.io/clifford/reference/Extract.md)
which extracts *all* coefficients of a clifford object:

``` r
coeffs(a)
```

    ## A disord object with hash 95062597dd6246faa022dc8f8a57947483f5ba60 and elements
    ## [1]  5  6 -9 -3  3 -6  1 -1  4
    ## (in some order)

The index for the constant is formally `list(numeric(0))`, but this is a
pain to type, so there is special dispensation for argument `B` having
list elements of zero, which are translated by helper function
[`list_modifier()`](https://robinhankin.github.io/clifford/reference/Extract.md)
to `numeric(0)` and listified if necessary. The upshot is that a zero
list element in argument `B` works as expected extracting the constant.
Also, passing `B=0` works as expected, returning the constant (there is
no need to coerce to a list: coercion is performed by `list_modifier)`.
A similar scheme is used in the square bracket extraction and
replacement methods

Attempting to extract a coefficient of a term that includes a negative
index will throw an error. The coefficient of a term including an index
larger than indicated by
[`maxyterm()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)
will return zero.

## References

Hankin, R. K. S. 2025. “Clifford Algebra in R: Introducing the clifford
Package.” *Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.
