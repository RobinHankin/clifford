# Extract or Replace Parts of a clifford

Extract or replace subsets of cliffords.

## Usage

``` r
# S3 method for class 'clifford'
C[index, ..., drop = FALSE]
# S3 method for class 'clifford'
C[index, ...] <- value
coeffs(x)
coeffs(x) <- value
list_modifier(B)
getcoeffs(C, B)
# S3 method for class 'clifford'
Im(z)
# S3 method for class 'clifford'
Re(z)
```

## Arguments

- C,x,z:

  A clifford object

- index:

  elements to extract or replace

- value:

  replacement value

- B:

  A list of integer vectors, terms

- drop:

  Boolean: should constant clifford objects be coerced to numeric?

- ...:

  Further arguments

## Details

Extraction and replacement methods. The extraction method uses
`getcoeffs()` and the replacement method uses low-level helper function
[`c_overwrite()`](https://robinhankin.github.io/clifford/reference/lowlevel.md).

In the extraction function `a[index]`, if `index` is a list, further
arguments are ignored; if not, the dots are used. If `index` is a list,
its elements are interpreted as integer vectors indicating which terms
to be extracted (even if it is a `disord` object). If `index` is a
`disord` object, standard consistency rules are applied. The extraction
methods are designed so that idiom such as `a[coeffs(a)>3]` works.

For replacement methods, the standard use-case is `a[i] <- b` in which
argument `i` is a list of integer vectors and `b` a length-one numeric
vector; (replacement vectors of length greater than one are currently
not implemented, whether or not they violate `disordR` discipline).
Otherwise, to manipulate parts of a clifford object, use
`coeffs(a) <- value`; `disord` discipline is enforced. Idiom such as
`a[coeffs(a)<2] <- 0` is implemented experimentally, as syntactic sugar
for `coeffs(a)[coeffs(a)<2] <- 0`. Replacement using a list-valued
index, as in `A[i] <- value` uses an ugly hack if `value` is zero.
Replacement methods are not yet finalised and not yet fully integrated
with the `disordR` package.

Idiom such as `a[] <- b` follows the `spray` package. If `b` is a
length-one scalar, then `coeffs(a) <- b` has the same effect as
`a[] <- b`.

Grade-based replacement methods such as `grade(C,n) <- value` are
impemented and documented at `grade.Rd`.

Functions
[`terms()`](https://robinhankin.github.io/clifford/reference/term.md)
\[see `term.Rd`\] and `coeffs()` extract the terms and coefficients from
a clifford object. These functions return `disord` objects but the
ordering is consistent between them (an extended discussion of this
phenomenon is presented in the
[mvp](https://CRAN.R-project.org/package=mvp) package). Note that
`coeffs()` returns `numeric(0)` on the zero clifford object.

Function `coeffs<-()` (idiom `coeffs(a) <- b`) sets all coefficients of
`a` to `b`. This has the same effect as `a[] <- b`.

Extracting or replacing a list with a repeated elements is usually a Bad
Idea (tm). However, if option `warn_on_repeats` is set to `FALSE`, no
warning will be given (and the coefficient will be the sum of the
coefficients of the term; see the examples).

Function `getcoeffs()` is a lower-level helper function that lacks the
succour offered by `[.clifford()`. It returns a named numeric vector
\[not a `disord` object: the order of the elements is determined by the
order of argument `B`\]. Compare standard extraction, eg `a[index]`,
which returns a clifford object. The names of the returned vector are
determined by function
[`catterm()`](https://robinhankin.github.io/clifford/reference/print.md).

Attempting to extract a coefficient of a term that includes a negative
index will throw an error. The coefficient of a term not present in the
Clifford object (including term with an index larger than indicated by
[`maxyterm()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md))
will return zero.

The index for the constant is formally `list(numeric(0))`, but this is a
pain to type. Square bracket extraction and `getcoeffs()` have special
dispensation for zero entries, which are translated by helper function
`list_modifier()` to `numeric(0)` and listified if necessary. The upshot
is that `x[0]` and `getcoeffs(x,0)` work as expected, returning the
constant.

Function `Im()` is a generic, which sets the real component of its
argument to zero (as per the
[onion](https://CRAN.R-project.org/package=onion) package). Function
`Re()` is a convenience synonym for
[`const()`](https://robinhankin.github.io/clifford/reference/const.md).

Vignette `getcoeffs` gives a more extended discussion of function
`getcoeffs()`.

## See also

[`Ops.clifford`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md),
[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md),
[`term`](https://robinhankin.github.io/clifford/reference/term.html)
[`grade`](https://robinhankin.github.io/clifford/reference/grade.md)

## Examples

``` r
A <- clifford(list(1,1:2,1:3),1:3)
B <- clifford(list(1:2,1:6),c(44,45))

A[1,c(1,3,4)]
#> Element of a Clifford algebra, equal to
#> + 1e_1

A[2:3, 4] <- 99
A[] <- B



X <- 5 + 6*e(1) -7*e(1:3) + 3*e(4:5)
X[0]           # special dispensation for zero
#> Element of a Clifford algebra, equal to
#> scalar ( 5 )
X[0,drop=TRUE] # coerce to numeric
#> [1] 5
X[list(0,1:3)] 
#> Element of a Clifford algebra, equal to
#> + 5 - 7e_123

getcoeffs(X,0)
#> e_0 
#>   5 
getcoeffs(X,list(1,0,1:3))
#>   e_1   e_0 e_123 
#>     6     5    -7 

# clifford(list(1,1:2,1:2),1:3)  # would give a warning

options("warn_on_repeats" = FALSE)
clifford(list(1,1:2,1:2),1:3)  # works; 1e1 + 5e_12
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 5e_12

options("warn_on_repeats" = TRUE) # return to default behaviour.

```
