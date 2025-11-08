# Function \`pseudoscalar()\` in the \`clifford\` package

![](../../../_temp/Library/clifford/help/figures/clifford.png)![](../../../_temp/Library/permutations/help/figures/permutations.png)

``` r
pseudoscalar
```

    ## function () 
    ## {
    ##     m <- getOption("maxdim")
    ##     if (is.null(m)) {
    ##         stop("pseudoscalar requires a finite value of maxdim; set it with something like options(maxdim = 6)")
    ##     }
    ##     else {
    ##         return(e(seq_len(m)))
    ##     }
    ## }

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document discusses
the pseudoscalar \\I\\ in the `clifford` R package. The behaviour of
\\I\\ depends on the dimension \\n\\ and the signature of the space
considered, and as such function
[`pseudoscalar()`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)
fails if `maxdim` is not set:

``` r
pseudoscalar()
```

    ## Error in pseudoscalar(): pseudoscalar requires a finite value of maxdim; set it with something like options(maxdim = 6)

Function
[`pseudoscalar()`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)
needs option `maxdim` to ascertain what object to return. Let us set
`maxdim` to 7:

``` r
options(maxdim=7)
pseudoscalar()
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1234567

The example above makes it clear that
[`pseudoscalar()`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)
returns the *unit* pseudoscalar, in whatever dimension we are working
in. The usual workflow would be to define `maxdim` and a signature at
the start of a session, then define an R object (conventionally `I`), as
the pseudoscalar. However, in this vignette we will repeatedly redefine
the signature and the maximum dimension to illustrate different aspects
of
[`pseudoscalar()`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md).
The first feature of \\I\\ is that \\\left\|I\right\|^2=1\\. For
standard \\\mathbb{R}^2\\ and \\\mathbb{R}^3\\, and Minkowski space
\\\operatorname{Cl}(3,1)\\ we have \\I^2=-1\\:

``` r
options(maxdim=3)
signature(3)       # Cl(3,0)
(I <- pseudoscalar())
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_123

``` r
drop(I^2)
```

    ## [1] -1

And for Minkowski space:

``` r
options(maxdim=4)
signature(3,1)       # Cl(3,1)
I <- pseudoscalar()
drop(I^2)
```

    ## [1] -1

However, we can easily define other signatures in which \\I^2=+1\\:

``` r
options(maxdim=4)
signature(2,2)       # Cl(2,2)
(I <- pseudoscalar())
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1234

``` r
drop(I^2)
```

    ## [1] 1

The pseudoscalar I defines an orientation in the sense that, for any
ordered set of \\n\\ linearly independent vectors \\a_1,\ldots, a_n\\
their outer product will have either the same or opposite sign as \\I\\.
Because the orientation is negated by interchanging a pair of vectors,
we see that the orientation is preserved by even permutations of
\\1,2,\ldots,n\\. Working in \\\operatorname{Cl}(5,0)\\:

``` r
options(maxdim=5)
signature(5)
I <- pseudoscalar()
ai <- list(); for(i in 1:5){ai[[i]] <- as.1vector(rnorm(5))}
ai[[1]] # the other 5 look very similar
```

    ## Element of a Clifford algebra, equal to
    ## + 1.262954e_1 - 0.3262334e_2 + 1.329799e_3 + 1.272429e_4 + 0.4146414e_5

``` r
Reduce(`^`,ai)
```

    ## Element of a Clifford algebra, equal to
    ## + 3.32019e_12345

Above we see, from the last line, that the vectors \\a_1\\ to \\a_5\\
are independent (the result is nonzero). Further, we see that the
vectors are a right-handed set, for the wedge product is positive. We
can permute the vectors using the `permutations` package ([Hankin
2020](#ref-hankin2020_permutations)):

``` r
(p <- permutation("(12)(345)"))
```

    ## [1] (12)(345)

``` r
is.even(p)
```

    ## [1] FALSE

Above, we see that `p` is an *odd* permutation, being a product of a
transposition and a three-cycle.

``` r
c(drop(Reduce(`^`,ai)),drop(Reduce(`^`,ai[as.word(p)])))
```

    ## [1]  3.32019 -3.32019

Above, we see that the sign of the wedge product of the permuted list
has changed, consistent with the permutation’s being odd. We know
various things about the pseudoscalar; below we will verify that
\\a\cdot\left(AI\right)=a\wedge AI\\ for vector \\a\\ and multivector
\\A\\:

``` r
options(maxdim=7)   
signature(7)
(I <- pseudoscalar())
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1234567

``` r
(a <- as.1vector(sample(1:10,5)))
```

    ## Element of a Clifford algebra, equal to
    ## + 7e_1 + 6e_2 + 1e_3 + 4e_4 + 8e_5

``` r
(A <- rcliff())
```

    ## Element of a Clifford algebra, equal to
    ## + 7 + 2e_4 + 7e_234 - 6e_1345 + 9e_16 - 8e_126 + 6e_236 + 3e_1236 - 1e_1356 -
    ## 9e_2456

Above we choose randomish values for \\a\\ and \\A\\. Observe that \\A\\
has terms of different grades; it is not homogeneous. Numerical
verification is straightforward \[NB: “`%.%`” breaks markdown
documents\]:

``` r
LHS <- cliffdotprod(a, A*I) # Usual idiom would be "a %.% (A*I)"
RHS <- (a^A)*I
LHS - RHS
```

    ## Element of a Clifford algebra, equal to
    ## the zero clifford element (0)

## References

Hankin, R. K. S. 2020. “Introducing the Permutations R Package.”
*SoftwareX* 11.

———. 2025. “Clifford Algebra in R: Introducing the clifford Package.”
*Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.
