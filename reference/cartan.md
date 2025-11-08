# Cartan map between clifford algebras

Cartan's map isomorphisms from \\\operatorname{Cl}(p,q)\\ to
\\\operatorname{Cl}(p-4,q+4)\\ and \\\operatorname{Cl}(p+4,q-4)\\

## Usage

``` r
cartan(C, n = 1)
cartan_inverse(C, n = 1)
```

## Arguments

- C:

  Object of class `clifford`

- n:

  Strictly positive integer

## Value

Returns an object of class `clifford`. The default value `n=1` maps
\\\operatorname{Cl}(4,q)\\ to \\\operatorname{Cl}(0,q+4)\\ (`cartan()`)
and \\\operatorname{Cl}(0,q)\\ to \\\operatorname{Cl}(4,q-4)\\.

## References

E. Hitzer and S. Sangwine 2017. “Multivector and multivector matrix
inverses in real Clifford algebras”, *Applied Mathematics and
Computation*. 311:3755-89

## Author

Robin K. S. Hankin

## See also

[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md)

## Examples

``` r
a <- rcliff(d=7)   # Cl(4,3)
b <- rcliff(d=7)   # Cl(4,3)
signature(4, 3)    # e1^2 = e2^2 = e3^2 = e4^2 = +1; e5^2 = e6^2=e7^2 = -1
ab <- a*b          # multiplication in Cl(4,3)

signature(0, 7)   # e1^2 = ... = e7^2 = -1
cartan(a)*cartan(b) == cartan(ab) # multiplication in Cl(0,7); should be TRUE
#> [1] TRUE

signature(Inf)  # restore default
```
