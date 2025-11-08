# Antivectors or pseudovectors

Antivectors or pseudovectors

## Usage

``` r
antivector(v, n = length(v))
as.antivector(v)
is.antivector(C, include.pseudoscalar=FALSE)
```

## Arguments

- v:

  Numeric vector

- n:

  Integer specifying dimensionality of underlying vector space

- C:

  Clifford object

- include.pseudoscalar:

  Boolean: should the pseudoscalar be considered an antivector?

## Details

An antivector is an \\n\\-dimensional Clifford object, all of whose
terms are of grade \\n-1\\. An antivector has \\n\\ degrees of freedom.
Function `antivector(v,n)` interprets `v[i]` as the coefficient of
\\e_1e_2\ldots e\_{i-1}e\_{i+1}\ldots e_n\\.

Function `as.antivector()` is a convenience wrapper, coercing its
argument to an antivector of minimal dimension (zero entries are
interpreted consistently).

The pseudoscalar is a peculiar edge case. Consider:

      A <- clifford(list(c(1,2,3)))
      B <- A + clifford(list(c(1,2,4)))

    > is.antivector(A)
    [1] FALSE
    > is.antivector(B)
    [1] TRUE
    > is.antivector(A,include.pseudoscalar=TRUE)
    [1] TRUE
    > is.antivector(B,include.pseudoscalar=TRUE)
    [1] TRUE

One could argue that `A` should be an antivector as it is a term in `B`,
which is definitely an antivector. Use `include.pseudoscalar=TRUE` to
ensure consistency in this case.

Compare
[`as.1vector()`](https://robinhankin.github.io/clifford/reference/numeric_to_clifford.md),
which returns a clifford object of grade 1.

## Note

An antivector is always a blade.

## Author

Robin K. S. Hankin

## See also

[`as.1vector`](https://robinhankin.github.io/clifford/reference/numeric_to_clifford.md)

## Examples

``` r
antivector(1:5)
#> Element of a Clifford algebra, equal to
#> + 5e_1234 + 4e_1235 + 3e_1245 + 2e_1345 + 1e_2345

as.1vector(c(1,1,2)) %X% as.1vector(c(3,2,2))
#> Element of a Clifford algebra, equal to
#> - 1e_12 - 4e_13 - 2e_23
c(1*2-2*2, 2*3-1*2, 1*2-1*3)  # note sign of e_13
#> [1] -2  4 -1
```
