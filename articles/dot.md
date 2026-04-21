# The dot: commutators and the Jacobi identity in the clifford package

![](../../../_temp/Library/clifford/help/figures/clifford.png)

To cite the `freealg` package in publications, please use Hankin
([2022](#ref-hankin2022_freealg)). This short document introduces the
dot object and shows how it can be used to work with commutators and
verify the Jacobi identity. In the `clifford` package, we define
\\\left\[A,B\right\] := (AB-BA)/2\\. The factor of \\\frac{1}{2}\\ is to
consistentify the Lie bracket with the cross product \\A\times B\\. The
prototypical `dot.Rmd` is that of the `freealg` package ([Hankin
2022](#ref-hankin2022_freealg)). The dot object is a (trivial) `S4`
object of class `dot`:

``` r
`.` <- new("dot")
```

The point of the dot (!) is that it allows one to calculate the Lie
bracket \\\[x,y\]=(xy-yx)/2\\ using R idiom `.[x,y]` in the `clifford`
package. Thus:

``` r
(x <- 1 + 3*e(2))
```

    ## Element of a Clifford algebra, equal to
    ## + 1 + 3e_2

``` r
(y <- 5*e(3) - 7*e(1:3)) 
```

    ## Element of a Clifford algebra, equal to
    ## + 5e_3 - 7e_123

``` r
.[x,y]
```

    ## Element of a Clifford algebra, equal to
    ## + 15e_23

We see that these two clifford objects do not commute. It is possible to
apply the dot construction `.[x,y]` to more complicated examples. Here I
show that the Lie bracket is nonassociative:

``` r
z <- 3 - e(1:4)
.[x,.[y,z]]
```

    ## Element of a Clifford algebra, equal to
    ## - 21e_24

``` r
.[.[x,y],z]
```

    ## Element of a Clifford algebra, equal to
    ## the zero clifford element (0)

``` r
.[x,.[y,z]] == .[.[x,y],z]
```

    ## [1] FALSE

However, it does satisfy the Jacobi identity
\\\left\[x,\left\[y,z\right\]\right\]+\left\[y,\left\[z,x\right\]\right\]+
\left\[z,\left\[x,y\right\]\right\]=0\\:

``` r
.[x,.[y,z]] + .[y,.[z,x]] + .[z,.[x,y]]
```

    ## Element of a Clifford algebra, equal to
    ## the zero clifford element (0)

### Bivectors

It is an interesting, useful, and nontrivial fact that the commutator of
two bivectors is a bivector:

``` r
(a <- rcliff(d=9,g=2,include.fewer=FALSE))
```

    ## Element of a Clifford algebra, equal to
    ## - 8e_13 - 5e_23 + 9e_25 + 5e_17 - 7e_37 - 6e_49 - 4e_59 + 2e_69

``` r
(b <- rcliff(d=9,g=2,include.fewer=FALSE))
```

    ## Element of a Clifford algebra, equal to
    ## + 7e_14 - 9e_24 + 2e_16 + 3e_36 - 1e_67 - 3e_48 + 6e_49 + 8e_79

``` r
.[a,b]
```

    ## Element of a Clifford algebra, equal to
    ## + 11e_34 - 105e_45 - 19e_16 - 15e_26 + 9e_36 + 12e_46 + 83e_47 + 32e_57 -
    ## 27e_67 + 78e_19 - 54e_29 - 62e_39 - 2e_79 + 18e_89

``` r
grades(.[a,b])
```

    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2

### Package dataset

Following lines create `dot.rda`, residing in the `data/` directory of
the package.

``` r
save(`.`,file="dot.rda")
```

## References

Hankin, Robin K. S. 2022. “The Free Algebra in R.” arXiv.
<https://doi.org/10.48550/ARXIV.2211.04002>.
