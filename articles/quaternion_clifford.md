# Quaternionic arithmetic with Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)![](../../../_temp/Library/onion/help/figures/onion.png)

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document shows how
quaternionic arithmetic may be implemented as a special case of Clifford
algebras. This is done for illustrative purposes only; to manipulate
quaternions in R the `onion` package ([Hankin
2006](#ref-hankin2006_onion)) is much more efficient and includes more
transparent idiom.

Hamilton’s Broome Bridge insight:

\\ \mathbf{i}^2= \mathbf{j}^2= \mathbf{k}^2=
\mathbf{i}\mathbf{j}\mathbf{k}=-1 \\

The BBI and associativity together imply

\\ \mathbf{j}\mathbf{k}=-\mathbf{k}\mathbf{j}=\mathbf{i}\qquad
\mathbf{k}\mathbf{i}=-\mathbf{i}\mathbf{k}=\mathbf{j}\qquad
\mathbf{i}\mathbf{j}=-\mathbf{j}\mathbf{i}=\mathbf{k}\qquad \\

and if we require a distributive algebra we get the quaternions. A
general quaternion is of the form
\\a+\mathbf{i}b+\mathbf{j}c+\mathbf{k}d\\; addition is componentwise and
multiplication follows from the above.

To express quaternionic multiplication using Clifford algebra we make
the following identifications:

\\ \mathbf{i}\leftrightarrow -e\_{12}\\ \mathbf{j}\leftrightarrow
-e\_{13}\\ \mathbf{k}\leftrightarrow -e\_{23}\\ \\

Thus, for example,
\\\mathbf{ii}=(-e\_{12})(-e\_{12})=+e\_{1212}=-e\_{1122}=-1\\ and
\\\mathbf{ij}=(-e\_{12})(-e\_{13})=+e\_{1213}=-e\_{1123}=-e\_{23}=\mathbf{k}\\.
The default signature \[in which \\e_i^2=+1\\\] is fine here, but as a
safety measure we can set `maxdim` to 3:

``` r
options(maxdim=3)  # paranoid safety measure
```

We might wish to multiply \\q_1=1+2\mathbf{i}+3\mathbf{j}+4\mathbf{k}\\
by \\q_2=-2+\mathbf{i}-2\mathbf{j}+\mathbf{k}\\:

``` r
q1 <- +1 + 2* -e(c(1,2)) + 3*-e(c(1,3)) + 4*-e(c(2,3))
q1
```

    ## Element of a Clifford algebra, equal to
    ## + 1 - 2e_12 - 3e_13 - 4e_23

``` r
q2 <- -2 + 1* -e(c(1,2)) - 2*-e(c(1,3)) + 1*-e(c(2,3))
q2
```

    ## Element of a Clifford algebra, equal to
    ## - 2 - 1e_12 + 2e_13 - 1e_23

``` r
q1*q2
```

    ## Element of a Clifford algebra, equal to
    ## - 2 - 8e_12 + 6e_13 + 14e_23

The product would correspond to \\-2+8\mathbf{i} -6\mathbf{j}
-14\mathbf{k}\\. Note that the “`*`” in “`q1*q2`” is a *clifford*
product. It is possible to leverage the `onion` package and coerce
between `clifford` objects and quaternions (but don’t actually do it,
you crazy fool):

``` r
`clifford_to_quaternion` <- function(C){
    C <- as.clifford(C)
    tC <- disordR::elements(terms(C))
    stopifnot(all(c(tC,recursive=TRUE) <= 3))
    jj <- unlist(lapply(tC,length))
    stopifnot(all(jj <= 2))    # safety check
    stopifnot(all(jj%%2 == 0)) # safety check
    out <- matrix(c(const(C), -getcoeffs(C,list(c(1,2),c(1,3),c(2,3)) )))
    as.quaternion(out)
}
```

``` r
`quaternion_to_clifford` <- function(Q){
  Q <- as.numeric(Q)
  stopifnot(length(Q)==4)
  clifford(list(numeric(0),c(1,2),c(1,3),c(2,3)),c(Q[1],-Q[2:4]))
}
```

We may verify that these maps behave properly by defining some
random-ish quaternions and Clifford objects:

``` r
q1 <- +1 + 2* -e(c(1,2)) + 3*-e(c(1,3)) + 4*-e(c(2,3))
q2 <- -2 + 1* -e(c(1,2)) - 2*-e(c(1,3)) + 1*-e(c(2,3))
H1 <- as.quaternion(c(3,-5,2,1),single=TRUE)
H2 <- as.quaternion(c(1,2,-2,2),single=TRUE)
```

First, check that they are inverses of one another:

``` r
c(  # check they are inverses of one another
q1 == quaternion_to_clifford(clifford_to_quaternion(q1)),
q2 == quaternion_to_clifford(clifford_to_quaternion(q2)),
H1 == clifford_to_quaternion(quaternion_to_clifford(H1)),
H2 == clifford_to_quaternion(quaternion_to_clifford(H2))
)
```

    ## [1] TRUE TRUE TRUE TRUE

Next, verify that they are homomorphisms:

``` r
c(
q1*q2 == quaternion_to_clifford(clifford_to_quaternion(q1)*clifford_to_quaternion(q2)),
H1*H2 == clifford_to_quaternion(quaternion_to_clifford(H1)*quaternion_to_clifford(H2))
)
```

    ## [1] TRUE TRUE

Note that in package idiom the asterisk, “`*`” represents either
Clifford geometric product or Hamilton’s quaternionic multiplication
depending on its arguments.

## Alternative mapping

Alternatively we might consider the even subalgebra of
\\\operatorname{Cl}(0,3)\\ with general element \\q_0 + q_1e\_{23}
-q_2e\_{13} + q_3e\_{12}\\ (note change of sign for \\q_2\\). Thus

\\ \mathbf{i}\leftrightarrow e\_{23}\\ \mathbf{j}\leftrightarrow
-e\_{13}\\ \mathbf{k}\leftrightarrow e\_{12}\\ \\

A quick-and-dirty R function might be

``` r
signature(0,3)
cliff2quat <- function(C){
  out <- getcoeffs(C,list(numeric(0),c(2,3),c(1,3),c(1,2)))
  out[2] <- -out[2]
  as.quaternion(out,single=TRUE)
}

quat2cliff <- function(H){
  jj <- c(as.matrix(H))
  jj[2] <- -jj[2]
  clifford(list(numeric(0),c(2,3),c(1,3),c(1,2)),jj)
}
```

Then verification is straightforward:

``` r
c(
  cliff2quat(quat2cliff(H1)) == H1,
  cliff2quat(quat2cliff(H2)) == H2,
  quat2cliff(cliff2quat(q1)) == q1,
  quat2cliff(cliff2quat(q2)) == q2,
  cliff2quat(q1*q2) == cliff2quat(q1) * cliff2quat(q2),
  quat2cliff(H1*H2) == quat2cliff(H1) * quat2cliff(H2)
)
```

    ## [1] TRUE TRUE TRUE TRUE TRUE TRUE

## References

Hankin, R. K. S. 2006. “Normed Division Algebras with R: Introducing the
`onion` Package.” *R News* 6 (2): 49–52.

———. 2025. “Clifford Algebra in R: Introducing the clifford Package.”
*Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.
