# Deal with terms

By basis vector, I mean one of the basis vectors of the underlying
vector space \\R^n\\, that is, an element of the set \\\left\lbrace
e_1,\ldots,e_n\right\rbrace\\. A term is a wedge product of basis
vectors (or a geometric product of linearly independent basis vectors),
something like \\e\_{12}\\ or \\e\_{12569}\\. Sometimes I use the word
“term” to mean a wedge product of basis vectors together with its
associated coefficient: so \\7e\_{12}\\ would be described as a term.

From Perwass: a blade is the outer product of a number of 1-vectors (or,
equivalently, the wedge product of linearly independent 1-vectors). Thus
\\e\_{12}=e_1\wedge e_2\\ and \\e\_{12} + e\_{13}=e_1\wedge(e_2+e_3)\\
are blades, but \\e\_{12} + e\_{34}\\ is not.

Function
[`rblade()`](https://robinhankin.github.io/clifford/reference/rcliff.md),
documented at `rcliff.Rd`, returns a random blade.

Function `is.blade()` is not currently implemented: there is no easy way
to detect whether a Clifford object is a product of 1-vectors.

## Usage

``` r
terms(x)
is.blade(x)
is.basisblade(x)
```

## Arguments

- x:

  Object of class `clifford`

## Details

- Functions `terms()` and
  [`coeffs()`](https://robinhankin.github.io/clifford/reference/Extract.md)
  are the extraction methods. These are unordered vectors but the
  ordering is consistent between them (an extended discussion of this
  phenomenon is presented in the `mvp` package).

- Function `term()` returns a clifford object that comprises a single
  term with unit coefficient.

- Function `is.basisterm()` returns `TRUE` if its argument has only a
  single term, or is a nonzero scalar; the zero clifford object is not
  considered to be a basis term.

## References

C. Perwass. “Geometric algebra with applications in engineering”.
Springer, 2009.

## Author

Robin K. S. Hankin

## See also

[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md),[`rblade`](https://robinhankin.github.io/clifford/reference/rcliff.md)

## Examples

``` r
x <- rcliff()
terms(x)
#> A disord object with hash 7626c66c33b83172f7fd824a9fa20059caa7ca2c and elements
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
#> [1] 4
#> 
#> [[5]]
#> [1] 3 4 5
#> 
#> [[6]]
#> [1] 1 3 4 5
#> 
#> [[7]]
#> [1] 6
#> 
#> [[8]]
#> [1] 1 2 3 6
#> 
#> [[9]]
#> [1] 1 3 5 6
#> 
#> (in some order)

is.basisblade(x)
#> [1] FALSE

a <- as.1vector(1:3)
b <- as.1vector(c(0,0,0,12,13))

a %^% b # a blade
#> Element of a Clifford algebra, equal to
#> + 12e_14 + 24e_24 + 36e_34 + 13e_15 + 26e_25 + 39e_35
```
