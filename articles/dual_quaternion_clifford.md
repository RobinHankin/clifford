# Dual quaternions via Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)![](../../../_temp/Library/onion/help/figures/onion.png)

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document shows how
dual quaternions may be implemented using Clifford algebra. The dual
quaternions are an interesting and useful mathematical object which
finds applications in solid-body mechanics. Consider the following
multiplication table:

    ##     1   i   j   k    ε  εi  εj  εk
    ##  1  1   i   j   k    ε  εi  εj  εk
    ##  i  i  -1   k  -j   εi  -ε  εk -εj
    ##  j  j  -k  -1   i   εj -εk  -ε  εi
    ##  k  k   j  -i  -1   εk  εj -εi  -ε
    ##  ε  ε  εi  εj  εk    0   0   0   0
    ## εi εi  -ε  εk -εj    0   0   0   0
    ## εj εj -εk  -ε  εi    0   0   0   0
    ## εk εk  εj -εi   -ε   0   0   0   0

Thus, for example, \\ij=k\\ (not \\-k\\). Here, \\i,j,k\\ are the unit
quaternion basis elements (so \\i^2=j^2=k^2=ijk=-1\\) and
\\\varepsilon\\ is the dual unit that commutes with \\i,j,k\\ and
satisfies \\\varepsilon^2=0\\. We can implement this in a
rough-and-ready way with the `onion` package ([Hankin
2006](#ref-hankin2006_onion)) by observing that a dual quaternion may be
represented as \\A+\varepsilon B\\, where \\A\\ and \\B\\ are
quaternions. Then

\\ (A+\varepsilon B)(C+\varepsilon D)== AC + \varepsilon(AD+BC)\\

(note the absence of a \\BD\\ term, as \\\varepsilon^2=0\\). Very crude
R idiom for this would be to define a `DQ` object as a list of
quaternions, as in:

``` r
DQ_example <- list(as.quaternion(c(5,8,-3,3),single=TRUE), as.quaternion(c(-1,2,1,12),single=TRUE))
DQ_example
```

    ## [[1]]
    ##    [1]
    ## Re   5
    ## i    8
    ## j   -3
    ## k    3
    ## 
    ## [[2]]
    ##    [1]
    ## Re  -1
    ## i    2
    ## j    1
    ## k   12

Then the product can be implemented as follows:

``` r
DQ_prod_DQ <- function(DQ1,DQ2){
  A <- DQ1[[1]] ; B <- DQ1[[2]] ; C <- DQ2[[1]] ; D <- DQ2[[2]]
  list(A*C, A*D+B*C) 
}
```

We will use follow the coercion used in `inst/quaternion_clifford.Rmd`
(*not* the alternative mapping, which requires a different signature) to
coerce from cliffords to quaternions. We may map the dual quaternions to
Clifford objects by additionally identifying \\\varepsilon\\ with
\\e_4\\; to ensure \\e_4^2=0\\ we work with \\Cl(3,0)\\ which in package
idiom is set by executing `signature(3,0)`.

``` r
signature(3,0)
e(4)*e(4)
```

    ## Element of a Clifford algebra, equal to
    ## the zero clifford element (0)

\\ \mathbf{i}\leftrightarrow -e\_{12}\\ \mathbf{j}\leftrightarrow
-e\_{13}\\ \mathbf{k}\leftrightarrow -e\_{23}\\
\varepsilon\leftrightarrow e_4 \\

Conversion functions would be

``` r
`cliff_to_DQ` <- function(C){  # terms such as e_3 and e_123 and e_34 are silently discarded
    quat <- getcoeffs(C,list(numeric(0),c(1,2),c(1,3),c(2,3)))
    quat[-1] <- -quat[-1]

    epsi <- getcoeffs(C,list(4,c(1,2,4),c(1,3,4),c(2,3,4)))
    epsi[-1] <- -epsi[-1]

    return(list(as.quaternion(quat,single=TRUE),as.quaternion(epsi,single=TRUE)))
} 


`DQ_to_cliff` <- function(DQ){ # DQ is a two-element list of quaternions
  jj1 <- c(as.matrix(DQ[[1]]))
  jj1[-1] <- -jj1[-1]
  jj2 <- c(as.matrix(DQ[[2]]))
  jj2[-1] <- -jj2[-1]
  
 clifford(list(numeric(0),c(1,2),c(1,3),c(2,3),4,c(1,2,4),c(1,3,4),c(2,3,4)),c(jj1,jj2))
}
```

Check that `DQ_to_cliff()` is indeed a homomorphism:

``` r
DQ1 <- list(as.quaternion(c(5,6,2,-7),single=TRUE),as.quaternion(c(-3,1,4,8),single=TRUE))
DQ2 <- list(as.quaternion(c(-1,3,1,4),single=TRUE),as.quaternion(c(1,9,-7,4),single=TRUE))
LHS <- DQ_to_cliff(DQ1) * DQ_to_cliff(DQ2)
RHS <- DQ_to_cliff(DQ_prod_DQ(DQ1,DQ2))
LHS == RHS
```

    ## [1] TRUE

Checking that `cliff_to_DQ()` is a homomorphism follows the same line of
reasoning:

``` r
C1 <- clifford(list(numeric(0),c(1,3),c(1,2,4),c(1,3,4)),c(3,7,11,13))
C2 <- clifford(list(numeric(0),c(1,2),c(1,3),c(1,3,4)),c(2,5,6,17))

LHS <- cliff_to_DQ(C1*C2)
RHS <- DQ_prod_DQ(cliff_to_DQ(C1),cliff_to_DQ(C2))
identical(LHS,RHS)
```

    ## [1] TRUE

The final verification is to check that functions `cliff_to_DQ()` and
`DQ_to_cliff()` are isomorphisms:

``` r
identical(DQ1,cliff_to_DQ(DQ_to_cliff(DQ1)))
```

    ## [1] TRUE

``` r
identical(C1,DQ_to_cliff(cliff_to_DQ(C1)))
```

    ## [1] TRUE

## References

Hankin, R. K. S. 2006. “Normed Division Algebras with R: Introducing the
`onion` Package.” *R News* 6 (2): 49–52.

———. 2025. “Clifford Algebra in R: Introducing the clifford Package.”
*Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.
