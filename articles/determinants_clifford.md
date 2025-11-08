# Determinants using Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document shows how
determinants can be calculated using Clifford algebra as implemented by
the `clifford` R package; notation follows Hestenes and Sobczyk
([1987](#ref-hestenes1987)). The methods shown here are not
computationally efficient compared with bespoke linear algebra
implementations (such as used in base R).

Given a square matrix \\M\\, we consider alternating forms on its column
vectors. Requiring that the identity matrix map to \\+1\\ gives a unique
alternating form which we identify with the determinant of \\M\\.
Hestenes points out that wedge products of 1-vectors are alternating
forms and further points out \[equation 4.1, p33\] that any alternating
\\r\\-form \\\alpha_r=\alpha_r\left(a_1,a_2,\ldots,a_r\right)\\ can be
written in the form

\\\alpha_r\left(a_1,a_2,\ldots,a_r\right)=
A_r^\dagger\cdot\left(a_1\wedge a_2\wedge\cdots\wedge a_r\right) \\

for some unique \\r\\-vector \\A_r^\dagger\\ . We then define the
determinant to be the \\r\\-form corresponding to \\A\\ being the
Clifford \\r\\-volume element. In the package this is easy to implement.
Considering a \\3\times 3\\ matrix as an example, we simply calculate
the wedge product of its columns:

``` r
suppressMessages(library("clifford"))
set.seed(0)
(M <- matrix(rnorm(9),3,3))
```

    ##            [,1]       [,2]         [,3]
    ## [1,]  1.2629543  1.2724293 -0.928567035
    ## [2,] -0.3262334  0.4146414 -0.294720447
    ## [3,]  1.3297993 -1.5399500 -0.005767173

``` r
o <- as.1vector(M[,1]) ^ as.1vector(M[,2]) ^ as.1vector(M[,3])
Adag <- rev(e(seq_len(3)))
c(drop(Adag %.% o), det(M))
```

    ## [1] -1.031795 -1.031795

Above, we see numerical agreement \[as a parenthetical note, we observe
that the dagger is needed to get the correct sign if the dimension is
odd\]. Alternatively, we can examine the wedge product directly:

``` r
as.1vector(M[,1]) ^ as.1vector(M[,2]) ^ as.1vector(M[,3])
```

    ## Element of a Clifford algebra, equal to
    ## - 1.031795e_123

Note that the wedge product is given as a Clifford volume element. We
can extract its coefficient (which would be the determinant of `M`)
using
[`coeffs()`](https://robinhankin.github.io/clifford/reference/Extract.md):

``` r
coeffs(as.1vector(M[,1]) ^ as.1vector(M[,2]) ^ as.1vector(M[,3]))
```

    ## [1] -1.031795

Just as a consistency check, we evaluate the wedge product of a set of
basis vectors, effectively calculating the determinant of \\I_3\\:

``` r
coeffs(e(1) ^ e(2) ^ e(3))
```

    ## [1] 1

We see \\+1\\, as expected. It is possible to consider larger matrices:

``` r
cliff_det <- function(M){
  o <- as.1vector(M[,1])
  for(i in 2:nrow(M)){
    o <- o ^ as.1vector(M[,i])
  }
  return(coeffs(o))
}
```

Then

``` r
M <- matrix(rnorm(100),10,10)
LHS <- det(M)
RHS <- cliff_det(M)
c(LHS,RHS,LHS-RHS)
```

    ## [1] 147.84 147.84   0.00

above we see numerical agreement.

## References

Hankin, R. K. S. 2025. “Clifford Algebra in R: Introducing the clifford
Package.” *Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.

Hestenes, D., and G. Sobczyk. 1987. *Clifford Algebra to Geometric
Calculus*. Kluwer.
