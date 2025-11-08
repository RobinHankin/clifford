# Function \`signature()\` in the \`clifford\` package

![](../../../_temp/Library/clifford/help/figures/clifford.png)![](../../../_temp/Library/lorentz/help/figures/lorentz.png)

``` r
signature
```

    ## function (p, q = 0) 
    ## {
    ##     if (missing(p)) {
    ##         s <- getOption("signature")
    ##         if (is.null(s)) {
    ##             s <- c(.Machine$integer.max, 0)
    ##         }
    ##         showsig(s)
    ##         class(s) <- "sigobj"
    ##         return(s)
    ##     }
    ##     else {
    ##         s <- c(p, q)
    ##         m <- getOption("maxdim")
    ##         if (!is.null(m)) {
    ##             if (p + q > m) {
    ##                 stop("signature requires p+q <= maxdim")
    ##             }
    ##         }
    ##         p <- min(s[1], .Machine$integer.max)
    ##         q <- min(s[2], .Machine$integer.max)
    ##         stopifnot(is_ok_sig(s))
    ##         options(signature = c(p, q))
    ##         showsig(s)
    ##         return(invisible(s))
    ##     }
    ## }

To cite the `clifford` package in publications please use Hankin
([2025a](#ref-hankin2025_clifford_rmd)). This short document discusses
[`signature()`](https://robinhankin.github.io/clifford/reference/signature.md)
in the `clifford` R package. As an example we might wish to work in
\\\operatorname{Cl}(1,2)\\:

``` r
signature(1,2)
```

Thus \\e_1^2=+1\\, and \\e_2^2=e_3^2=-1\\:

``` r
c(drop(e(1)^2),drop(e(2)^2),drop(e(3)^2))
```

    ## [1]  1 -1 -1

We might ask what \\e_4^2\\ would evaluate to, and this is assumed to be
zero as is \\e_i^2\\ for \\i\geqslant 4\\:

``` r
c(drop(e(4)^2),drop(e(100)^2))
```

    ## [1] 0 0

If we wish to set paranoid-level safety measures, we would set option
`maxdim` to prevent accidentally working with too-large values of \\i\\:

``` r
options(maxdim = 4)
```

Now we work with a four-dimensional vector space in which
\\e_1^2=+1,e_2^2=e_3^2=-1,e_4^2=0\\, but now \\e_5\\ is undefined:

``` r
c(drop(e(1)^2),drop(e(2)^2),drop(e(3)^2),drop(e(4)^2))
```

    ## [1]  1 -1 -1  0

``` r
e(5)
```

    ## Error in is_ok_clifford(terms, coeffs): option maxdim exceeded

The operation of
[`signature()`](https://robinhankin.github.io/clifford/reference/signature.md)
is modelled on the `sol()` function in the `lorentz` package ([Hankin
2025b](#ref-hankin2025_lorentz)). Thus, if given no arguments we return
the signature:

``` r
signature()
```

    ## [1] 1 2

However, the default value is to use an infinite signature which
corresponds to \\e_i^2=1\\ for all i\$:

``` r
options(maxdim=NULL)
signature(Inf)
signature()
```

    ## [1] Inf   0

Function
[`signature()`](https://robinhankin.github.io/clifford/reference/signature.md)
returns an object of (trivial) class `sigobj` which has a bespoke print
method,
[`print.sigobj()`](https://robinhankin.github.io/clifford/reference/signature.md).
For technical reasons an infinite signature is not allowed but is
represented internally by a near-infinite integer, specifically
`.Machine$integer.max`:

``` r
dput(signature())
```

    ## structure(c(2147483647, 0), class = "sigobj")

## References

Hankin, R. K. S. 2025a. “Clifford Algebra in R: Introducing the clifford
Package.” *Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.

———. 2025b. “Special Relativity in R: The Lorentz Package.” *Journal of
Open Source Education* 8 (88): 196.
<https://doi.org/10.21105/jose.00196>.
