The clifford package: Clifford algebra in R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="man/figures/clifford.png" width = "150" align="right" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/clifford)](https://cran.r-project.org/package=clifford)
[![Codecov test
coverage](https://app.codecov.io/gh/RobinHankin/clifford/branch/master/graph/badge.svg)](https://app.codecov.io/gh/RobinHankin/clifford/branch/master)
<!-- badges: end -->

The `clifford` package provides R-centric functionality for working with
Clifford algebras of arbitrary dimension and signature. A detailed
vignette is provided in the package.

# Installation

You can install the released version of the clifford package from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("clifford")  # uncomment this to install the package
library("clifford")
set.seed(0)
```

# The `clifford` package in use

The basic creation function is `clifford()`, which takes a list of basis
blades and a vector of coefficients:

``` r
(a <- clifford(list(1,2,1:4,2:3),1:4))
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 2e_2 + 4e_23 + 3e_1234
(b <- clifford(list(2,2:3,1:2),c(-2,3,-3)))
#> Element of a Clifford algebra, equal to
#> - 2e_2 - 3e_12 + 3e_23
```

So `a` and `b` are multivectors. Clifford objects are a vector space and
we can add them using `+`:

``` r
a+b
#> Element of a Clifford algebra, equal to
#> + 1e_1 - 3e_12 + 7e_23 + 3e_1234
```

See how the `e2` term vanishes and the `e_23` term is summed. The
package includes a large number of products:

``` r
a*b        # geometric product (also "a % % b")
#> Element of a Clifford algebra, equal to
#> - 16 + 6e_1 - 3e_2 - 2e_12 + 14e_3 + 12e_13 + 3e_123 - 9e_14 + 9e_34 - 6e_134
a %^% b    # outer product
#> Element of a Clifford algebra, equal to
#> - 2e_12 + 3e_123
a %.% b    # inner product
#> Element of a Clifford algebra, equal to
#> - 16 + 6e_1 - 3e_2 + 14e_3 - 9e_14 + 9e_34 - 6e_134
a %star% b # scalar product
#> [1] -16
a %euc% b  # Euclidean product
#> [1] 8
```

The package can deal with non positive-definite inner products. Suppose
we wish to deal with an inner product of

![\begin{pmatrix}
+1 & 0 & 0 & 0 & 0\\
 0 &+1 & 0 & 0 & 0\\
 0 & 0 &+1 & 0 & 0\\
 0 & 0 & 0 &-1 & 0\\
 0 & 0 & 0 & 0 &-1
\end{pmatrix}](https://latex.codecogs.com/png.latex?%5Cbegin%7Bpmatrix%7D%0A%2B1%20%26%200%20%26%200%20%26%200%20%26%200%5C%5C%0A%200%20%26%2B1%20%26%200%20%26%200%20%26%200%5C%5C%0A%200%20%26%200%20%26%2B1%20%26%200%20%26%200%5C%5C%0A%200%20%26%200%20%26%200%20%26-1%20%26%200%5C%5C%0A%200%20%26%200%20%26%200%20%26%200%20%26-1%0A%5Cend%7Bpmatrix%7D "\begin{pmatrix}
+1 & 0 & 0 & 0 & 0\\
 0 &+1 & 0 & 0 & 0\\
 0 & 0 &+1 & 0 & 0\\
 0 & 0 & 0 &-1 & 0\\
 0 & 0 & 0 & 0 &-1
\end{pmatrix}")

where the diagonal is a number of
![+1](https://latex.codecogs.com/png.latex?%2B1 "+1") terms followed by
a number of ![-1](https://latex.codecogs.com/png.latex?-1 "-1") terms.
The package idiom for this would be to use `signature()`:

``` r
signature(3)
```

Function `signature()` is based on `lorentz::sol()` and its argument
specifies the number of basis blades that square to
![+1](https://latex.codecogs.com/png.latex?%2B1 "+1"), the others
squaring to ![-1](https://latex.codecogs.com/png.latex?-1 "-1"). Thus
![e_1^2=e_2^2=e_3^2=1](https://latex.codecogs.com/png.latex?e_1%5E2%3De_2%5E2%3De_3%5E2%3D1 "e_1^2=e_2^2=e_3^2=1")
and
![e_4^2=e_5^2=-1](https://latex.codecogs.com/png.latex?e_4%5E2%3De_5%5E2%3D-1 "e_4^2=e_5^2=-1"):

``` r
basis(1)
#> Element of a Clifford algebra, equal to
#> + 1e_1
basis(1)^2
#> Element of a Clifford algebra, equal to
#> scalar ( 1 )
basis(4)
#> Element of a Clifford algebra, equal to
#> + 1e_4
basis(4)^2
#> Element of a Clifford algebra, equal to
#> the zero clifford element (0)
```

The package uses the STL map class with dynamic bitset keys for
efficiency and speed and can deal with objects of arbitrary dimensions.
Thus:

``` r
options("basissep" = ",")
(x <- rcliff(d=20))
#> Element of a Clifford algebra, equal to
#> + 4 + 5e_2 + 1e_5 - 2e_4,7 + 2e_11 + 4e_14 - 1e_10,14 + 3e_5,9,15 - 3e_18,19
summary(x^3)
#> Element of a Clifford algebra 
#> Typical terms:  364  ...  + 54e_5,9,10,14,15,18,19 
#> Number of terms: 40 
#> Magnitude: 265721
```

# References

- D. Hestenes 1987. *Clifford algebra to geometric calculus*, Kluwer.
- J. Snygg 2010. *A new approach to differential geometry using
  Clifford’s geometric algebra*. Berghauser.
- C. Perwass 2009. *Geometric algebra with applications in engineering*.
  Springer.

# Further information

For more detail, see the package vignette

`vignette("clifford")`
