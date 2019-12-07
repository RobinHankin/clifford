The clifford package: Clifford algebra in R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/RobinHankin/clifford.svg?branch=master)](https://travis-ci.org/RobinHankin/clifford)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/clifford)](https://cran.r-project.org/package=clifford)
[![Rdoc](http://www.rdocumentation.org/badges/version/clifford)](http://www.rdocumentation.org/packages/clifford)
[![Codecov test
coverage](https://codecov.io/gh/RobinHankin/clifford/branch/master/graph/badge.svg)](https://codecov.io/gh/RobinHankin/clifford/branch/master)
<!-- badges: end -->

# Overview

The \``clifford` package provides R-centric functionality for working
with Clifford algebras of arbitrary dimension and signature. A detailed
vignette is provided in the package.

# Installation

You can install the released version of wedge from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("clifford")  # uncomment this to install the package
library("clifford")
set.seed(0)
```

# The \``clifford` package in use

``` r
a <- rcliff()
a
#> Element of a Clifford  algebra, equal to
#> + 6e_1 + 7e_2 + 8e_12 + 5e_1234 + 4e_5 + 1e_26 + 9e_36 + 3e_56 + 2e_156
```

  
![
\\frac{1}{2+2}
](https://latex.codecogs.com/png.latex?%0A%5Cfrac%7B1%7D%7B2%2B2%7D%0A "
\\frac{1}{2+2}
")  

# References

The most concise reference is

  - Spivak 1971. *Calculus on manifolds*, Addison-Wesley.

But an accessible book would be

  - Hubbard and Hubbard 2015. *Vector calculus, linear algebra, and
    differential forms: a unified approach*. Matrix Editions

# Further information

For more detail, see the package vignette

`vignette("clifford")`
