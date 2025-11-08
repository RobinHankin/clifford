# Arbitrary Dimensional Clifford Algebras

A suite of routines for Clifford algebras, using the 'Map' class of the
Standard Template Library. Canonical reference: Hestenes (1987, ISBN
90-277-1673-0, "Clifford algebra to geometric calculus"). Special cases
including Lorentz transforms, quaternion multiplication, and Grassmann
algebra, are discussed. Vignettes presenting conformal geometric
algebra, quaternions and split quaternions, dual numbers, and Lorentz
transforms are included. The package follows 'disordR' discipline.

## Details

The DESCRIPTION file: This package was not yet installed at build
time.  
Index: This package was not yet installed at build time.  

## Author

Robin K. S. Hankin \[aut, cre\] (ORCID:
\<https://orcid.org/0000-0001-5982-0415\>)

Maintainer: Robin K. S. Hankin \<hankin.robin@gmail.com\>

## References

- R. K. S. Hankin (2025). “Clifford algebra in R: introducing the
  [clifford](https://CRAN.R-project.org/package=clifford) package”.
  *Advances in Applied Clifford Algebra*,
  [doi:10.1007/s00006-025-01403-9](https://doi.org/10.1007/s00006-025-01403-9)

- J. Snygg (2012). *A new approach to differential geometry using
  Clifford's geometric Algebra*, Birkhauser. ISBN 978-0-8176-8282-8

- D. Hestenes (1987). *Clifford algebra to geometric calculus*, Kluwer.
  ISBN 90-277-1673-0

- C. Perwass (2009). *Geometric algebra with applications in
  engineering*, Springer. ISBN 978-3-540-89068-3

- D. Hildenbrand (2013). *Foundations of geometric algebra computing*.
  Springer, ISBN 978-3-642-31794-1

## See also

[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md)

## Examples

``` r
as.1vector(1:4)
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 2e_2 + 3e_3 + 4e_4

as.1vector(1:4) * rcliff()
#> Element of a Clifford algebra, equal to
#> + 6e_1 - 9e_2 + 12e_12 + 32e_3 - 8e_13 + 4e_23 + 7e_123 + 24e_4 + 28e_234 -
#> 16e_1234 + 6e_5 + 8e_15 + 16e_25 + 32e_35 + 2e_135 + 4e_235 + 26e_45 - 8e_345 -
#> 2e_1345 - 4e_2345 - 20e_16 + 36e_36 - 22e_46 - 10e_1246 - 24e_1346 - 18e_2346 +
#> 4e_256 - 2e_456 - 1e_12456 + 3e_23456

# Following from Ablamowicz and Fauser (see vignette):
x <- clifford(list(1:3, c(1,5,7,8,10)), c(4,-10)) + 2
y <- clifford(list(c(1,2,3,7), c(1,5,6,8), c(1,4,6,7)), c(4,1,-3)) - 1
x*y # signature irrelevant
#> Element of a Clifford algebra, equal to
#> - 2 - 4e_123 - 16e_7 + 8e_1237 - 6e_1467 - 12e_23467 + 2e_1568 + 4e_23568 +
#> 10e_6710 - 40e_235810 - 30e_456810 + 10e_157810
```
