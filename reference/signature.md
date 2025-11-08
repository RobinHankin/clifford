# The signature of the Clifford algebra

Getting and setting the signature of the Clifford algebra

## Usage

``` r
signature(p, q=0)
is_ok_sig(s)
showsig(s)
# S3 method for class 'sigobj'
print(x, ...)
```

## Arguments

- s, p, q:

  Integers, specifying number of positive elements on the diagonal of
  the quadratic form, with `s = c(p, q)`

- x:

  Object of class `sigobj`

- ...:

  Further arguments, currently ignored

## Details

The signature functionality is modelled on the
[lorentz](https://CRAN.R-project.org/package=lorentz) package;
`clifford::signature()` operates in the same way as
[`lorentz::sol()`](https://robinhankin.github.io/lorentz/reference/sol.html)
which gets and sets the speed of light. The idea is that both the speed
of light and the signature of a Clifford algebra are generally set once,
at the beginning of an R session, and subsequently change only very
infrequently.

Clifford algebras require a bilinear form
\\\left\langle\cdot,\cdot\right\rangle\\ on \\\mathbb{R}^n\\. If
\\{\mathbf x}=\left(x_1,\ldots,x_n\right)\\ we define

\$\$\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
+x_p^2-x\_{p+1}^2-\cdots -x\_{p+q}^2 \$\$

where \\p+q=n\\. With this quadratic form the vector space is denoted
\\\mathbb{R}^{p,q}\\ and we say that \\(p,q)\\ is the signature of the
bilinear form \\\left\langle\cdot,\cdot\right\rangle\\. This gives rise
to the Clifford algebra \\C\_{p,q}\\.

If the signature is \\(p,q)\\, then we have

\$\$ e_i e_i = +1\\ (\mbox{if } 1\leq i\leq p), -1\\ (\mbox{if } p+1\leq
i\leq p+q), 0\\ (\mbox{if } i\>p+q). \$\$

Note that \\(p,0)\\ corresponds to a positive-semidefinite quadratic
form in which \\e_ie_i=+1\\ for all \\i\leq p\\ and \\e_ie_i=0\\ for all
\\i \> p\\. Similarly, \\(0,q)\\ corresponds to a negative-semidefinite
quadratic form in which \\e_ie_i=-1\\ for all \\i\leq q\\ and
\\e_ie_i=0\\ for all \\i \> q\\.

A strictly positive-definite quadratic form is specified by infinite
\\p\\ \[in which case \\q\\ is irrelevant\], and `signature(Inf)`
implements this. For a strictly negative-definite quadratic form we
would have \\p=0,q=\infty\\ which would be `signature(0,Inf)`.

If we specify \\e_ie_i=0\\ for all \\i\\, then the operation reduces to
the wedge product of a Grassmann algebra. Package idiom for this is to
set \\p=q=0\\ with `signature(0,0)`, but this is not recommended: use
the [stokes](https://CRAN.R-project.org/package=stokes) package for
Grassmann algebras, which is much more efficient and uses nicer idiom.

Function `signature(p,q)` returns the signature invisibly; but setting
option `show_signature` to `TRUE` makes `showsig()` \[which is called by
`signature()`\] change the default prompt so it displays the signature,
much like `showSOL` in the
[lorentz](https://CRAN.R-project.org/package=lorentz) package. Note that
changing the signature changes the prompt immediately (if
`show_signature` is `TRUE`), but changing option `show_signature` has no
effect until `showsig()` is called.

Calling `signature()` \[that is, with no arguments\] returns an object
of class `sigobj` with elements corresponding to \\p\\ and \\q\\. There
is special dispensation for “infinite” \\p\\ or \\q\\: the `sigobj`
class ensures that a near-infinite integer such as
`.Machine$integer.max` will be printed as “`Inf`” rather than, for
example, “`2147483647`”.

Function `is_ok_sig()` is a helper function that checks for a proper
signature. If we set `signature(p,q)`, then technically \\n\>p+q\\
implies \\e_n^2=0\\, but usually we are not interested in \\e_n\\ when
\\n\>p+q\\ and want this to be an error. Option `maxdim` specifies the
maximum value of \\n\\, with default `NULL` corresponding to infinity.
If \\n\\ exceeds `maxdim`, then `is_ok_sig()` throws an error. Note that
it is sometimes fine to have `maxdim > p+q` \[and indeed this is useful
in the context of dual numbers\]. This option is intended to be a
super-strict safety measure.

    > e(6)
    Element of a Clifford algebra, equal to
    + 1e_6
    > options(maxdim=5)
    > e(5)
    Element of a Clifford algebra, equal to
    + 1e_5
    > e(6)
    Error in is_ok_clifford(terms, coeffs) : option maxdim exceeded

## Author

Robin K. S. Hankin

## Examples

``` r

signature()
#> [1] Inf   0

e(1)^2
#> Element of a Clifford algebra, equal to
#> scalar ( 1 )
e(2)^2
#> Element of a Clifford algebra, equal to
#> scalar ( 1 )

signature(1)
e(1)^2
#> Element of a Clifford algebra, equal to
#> scalar ( 1 )
e(2)^2   # note sign
#> Element of a Clifford algebra, equal to
#> the zero clifford element (0)

signature(3, 4)
sapply(1:10, function(i){drop(e(i)^2)})
#>  [1]  1  1  1 -1 -1 -1 -1  0  0  0


signature(Inf)   # restore default




# Nice mapping from Cl(0,2) to the quaternions (loading clifford and
# onion simultaneously is discouraged):

# library("onion")
# signature(0,2)
# Q1 <- rquat(1)
# Q2 <- rquat(1)
# f <- function(H){Re(H) + i(H)*e(1) + j(H)*e(2) + k(H)*e(1:2)}
# f(Q1)*f(Q2) - f(Q1*Q2) # zero to numerical precision
# signature(Inf)
```
