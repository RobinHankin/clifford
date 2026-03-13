# Conformal geometry with Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document shows how
conformal geometry may be implemented using the `clifford` R package; it
follows Hildenbrand ([2013](#ref-hildenbrand2013)) and Perwass
([2009](#ref-perwass2009)). Here we work in \\\operatorname{Cl}(p,q)\\,
which Perwass denotes \\\mathbb{G}\_{p,q}\\. The set of grade-\\k\\
objects is denoted \\\mathbb{G}\_{p,q}^k\\. First we define the IPNS and
OPNS \[inner product null space and outer product null space\] of
\\\mathbf{A}\in\mathbb{G}\_{p,q}^k\\.

\\ \begin{eqnarray} \operatorname{IPNS}(\mathbf{A}) &=&
\left\lbrace\mathbf{x}\in\mathbb{G}^1\_{p,q}\colon\mathbf{x}\cdot\mathbf{A}
= 0\right\rbrace\\ \operatorname{OPNS}(\mathbf{A}) &=&
\left\lbrace\mathbf{x}\in\mathbb{G}^1\_{p,q}\colon\mathbf{x}\wedge\mathbf{A}
= 0\right\rbrace \end{eqnarray} \\

Thus if \\\mathbf{A}=\left\langle
\mathbf{A}\right\rangle\_{k}=\bigwedge\_{i=1}^k\mathbf{a}\_i\\, then
\\\operatorname{OPNS}(\mathbf{A})=\operatorname{span}(\mathbf{a}\_1,\ldots,\mathbf{a}\_k)\subseteq\mathbb{G}\_{p,q}\\.
Further, \\\operatorname{OPNS}(\mathbf{A})\\ is linear in the sense that
\\\mathbf{x},\mathbf{y}\in\operatorname{OPNS}(\mathbf{A})\\ implies
\\\alpha\mathbf{x}+\beta\mathbf{y}\in\operatorname{OPNS}(\mathbf{A})\\
for any real numbers \\\alpha,\beta\\. We will use this system to
express a geometrical object \\\mathcal{G}\subset\mathbb{R}^3\\ (such as
a sphere or a line) as a point \\\mathbf{P}\\ in
\\\operatorname{Cl}(4,1)\\; the idea is that the IPNS or OPNS of
\\\mathbf{P}\\ is \\\mathcal{G}\\. This allows one to express
geometrical ideas in pure Clifford formalism, without needing to take a
dangerous and unsightly basis.

To work in R, we set up some basic features of conformal geometry.
Specifically, we consider the three Euclidean basis vectors
\\\mathbf{e}\_1\\, \\\mathbf{e}\_2\\, \\\mathbf{e}\_3\\ together with
two additional basis vectors \\\mathbf{e}\_+\\ and \\\mathbf{e}\_-\\
obeying \\\mathbf{e}\_+^2=1\\, \\\mathbf{e}\_-^2=0\\,
\\\mathbf{e}\_+\cdot\mathbf{e}\_-=0\\. If we define

\\
\mathbf{e}\_0=\frac{1}{2}\left(\mathbf{e}\_--\mathbf{e}\_+\right),\qquad
\mathbf{e}\_\infty=\mathbf{e}\_- +\mathbf{e}\_+ \\

then we may say that \\\mathbf{e}\_0\\ represents “the origin” and
\\\mathbf{e}\_\infty\\ represents “the point at infinity”. We see that
\\\mathbf{e}\_0^2=\mathbf{e}\_\infty^2=0\\ and
\\\mathbf{e}\_\infty\cdot\mathbf{e}\_0=-1\\; the geometric product is
given by \\\mathbf{e}\_\infty\mathbf{e}\_0=-E-1\\ and
\\\mathbf{e}\_0\mathbf{e}\_\infty=E-1\\ where
\\E=\mathbf{e}\_\infty\wedge\mathbf{e}\_0\\. It is straightforward to
implement these objects using the `clifford` package:

``` r
dimension <- 3
options("maxdim" = dimension+2)  # paranoid safety measure
signature(dimension + 1,1)
eplus <- basis(dimension+1)
eminus <- basis(dimension + 2)

e0 <-  (eminus - eplus)/2
einf <- eminus + eplus
E <- e0 ^ einf
```

So

``` r
e0
```

    ## Element of a Clifford algebra, equal to
    ## - 0.5e_4 + 0.5e_5

``` r
einf
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_4 + 1e_5

``` r
E
```

    ## Element of a Clifford algebra, equal to
    ## - 1e_45

## Points

With these definitions, we can consider Euclidean vectors
\\\mathbf{a},\mathbf{b}\in\mathbb{R}^3\\ and conformal embeddings
\\\mathbf{A},\mathbf{B}\\ given by

\\ \mathbf{A}=C(\mathbf{a})=\mathbf{a}+\mathbf{a}^2\mathbf{e}\_\infty/2
+\mathbf{e}\_0\qquad\mathbf{B}=C(\mathbf{b})=\mathbf{b}+\mathbf{b}^2\mathbf{e}\_\infty/2
+\mathbf{e}\_0 \\

This is straightforward in package idiom:

``` r
point <- function(x){ as.1vector(x) + sum(x^2)*einf/2 + e0 }
```

Thus `point()` takes an R vector of length 3 and returns its conformal
embedding. For example, we may translate points \\(1,2,5)\\ and
\\(2,2,2)\\ to their conformal equivalent:

``` r
a <- c(1,2,5)
b <- c(2,2,2)
point(a)
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 5e_3 + 14.5e_4 + 15.5e_5

``` r
point(b)
```

    ## Element of a Clifford algebra, equal to
    ## + 2e_1 + 2e_2 + 2e_3 + 5.5e_4 + 6.5e_5

It can be shown that
\\\mathbf{A}\cdot\mathbf{B}=-\left\lVert\mathbf{a}-\mathbf{b}\right\rVert^2/2\\
\[where the dot product is the Clifford inner product, `%.%`\]. Package
idiom to verify this would be

``` r
c(conformal=drop(point(a) %.% point(b)), Euclidean = -sum((a-b)^2)/2)
```

    ## conformal Euclidean 
    ##        -5        -5

showing that the two results match.

### Sphere, IPNS

We can define a sphere with center \\\mathbf{a}\\ and radius \\\rho\\ as

\\ \mathbf{S}=C(\mathbf{a}) - \rho^2\mathbf{e}\_\infty/2 \\

and then the sphere is just the inner product null space of
\\\mathbf{S}\\, that is
\\\left\lbrace\mathbf{x}\colon\mathbf{S}\cdot\mathbf{x}=0\right\rbrace\\.
This is straightforward to implement computationally. Suppose we have a
sphere of radius 5, center \\(1,2,3)\\:

``` r
sphere <- function(x,r){ point(x) - r^2*einf/2}
S <- sphere(1:3,5)  # center (1,2,3) radius 5:
S
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3 - 6e_4 - 5e_5

Then object `S` is a conformal representation of such a sphere. The
radius \\\rho\\ can be calculated from \\\mathbf{S}^2=\rho^2\\. Package
idiom:

``` r
drop(S^2)   # 5^2 = 25
```

    ## [1] 25

Finding the center of the sphere is slightly more involved; Hildenbrand
calls this the *sandwich* product given by
\\P=\mathbf{S}\mathbf{e}\_\infty\mathbf{S}\\:

``` r
S*einf*S
```

    ## Element of a Clifford algebra, equal to
    ## - 2e_1 - 4e_2 - 6e_3 - 13e_4 - 15e_5

Hildenbrand shows that the scaling factor is \\-2\\ so this gives us

``` r
-S*einf*S/2
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3 + 6.5e_4 + 7.5e_5

which we recognise as the point \\(1,2,3)\\:

``` r
point(1:3)
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3 + 6.5e_4 + 7.5e_5

### Sphere, OPNS

We can also consider the OPNS for a sphere, defined in terms of four
points that lie on it. For example, if our four points are \\(0,0,0)\\,
\\(1,0,0)\\, \\(0,1,0)\\, \\(0,0,1)\\ we would have a rather involved
algebraic calculation resulting in a sphere of radius
\\\frac{\sqrt{3}}{2}\\ and center
\\\left(\frac{1}{2},\frac{1}{2},\frac{1}{2}\right)\\.

The conformal representation for a sphere in OPNS would be

\\ S^\*=P_1\wedge P_2\wedge P_3\wedge P_4 \\

and points that lie on the sphere are the set

\\\left\lbrace\mathbf{x}\colon\mathbf{x}\wedge S^\*=0\right\rbrace.\\

Observe again that this parameterization does not require one to take a
basis of \\\mathbb{R}^3\\, as all the results are presented in terms of
vector quantities: at no point does one need to consider components or
elements of any vector. The R idiom for defining the sphere touching
\\\left\lbrace P_1,P_2,P_3,P_4\right\rbrace\\ is straightforward:

``` r
origin <- point(c(0,0,0))
px <- point(c(1,0,0))
py <- point(c(0,1,0))
pz <- point(c(0,0,1))

(S <- origin ^ px ^ py ^ pz)
```

    ## Element of a Clifford algebra, equal to
    ## + 0.5e_1234 - 0.5e_1235 - 0.5e_1245 + 0.5e_1345 - 0.5e_2345

And this is the representation for a sphere (translating this into a
center and radius is not yet implemented). Slightly slicker R idiom
might be:

``` r
spherestar <- function(...){Reduce(`^`,list(...))}
spherestar(origin, px, py, pz)
```

    ## Element of a Clifford algebra, equal to
    ## + 0.5e_1234 - 0.5e_1235 - 0.5e_1245 + 0.5e_1345 - 0.5e_2345

As a verification, we may check that point
\\\left(\frac{1}{2},\frac{1}{2},\frac{1}{2}+\frac{\sqrt{3}}{2}\right)\\
is on the sphere as well:

``` r
p <- point(c(1,1,1+sqrt(3))/2)
Mod(p ^ S)
```

    ## [1] 1.110223e-16

Above we see that \\p\wedge S\\ is zero to within numerical error. Again
observe that this is established *without* taking a basis of
\\\mathbb{R}^3\\.

## Planes

A plane is defined as \\\hat{\mathbf{n}} + d\mathbf{e}\_\infty\\, where
\\\hat{\mathbf{n}}\\ is the unit normal and \\d\\ the distance to the
origin.

``` r
plane <- function(n,d){ as.1vector(n/sqrt(sum(n^2))) + d*einf}
```

For example, we consider the plane \\\Pi\\ with normal
\\\mathbf{n}=\left(1,2,5\right)\\ and distance 7. We may use `plane()`
above but first need to calculate
\\\hat{\mathbf{n}}=\mathbf{n}/\left\|\mathbf{n}\right\|\\:

``` r
n <- c(1,2,5)
nhat <- n/sqrt(sum(n^2))
d <- 7
Pi <- plane(nhat,d)
Pi
```

    ## Element of a Clifford algebra, equal to
    ## + 0.1825742e_1 + 0.3651484e_2 + 0.9128709e_3 + 7e_4 + 7e_5

Just to check, we may verify that some points known to lie in \\\Pi\\
are in fact in its IPNS. We observe that the point
\\7\hat{\mathbf{n}}\in\Pi\\, and also that vectors
\\\mathbf{u}=(2,-1,0)\\ and \\\mathbf{v}=(5,0,-1)\\ are orthogonal to
the normal of \\\Pi\\. So \\7\hat{\mathbf{n}} + \alpha\mathbf{u} +
\beta\mathbf{v}\in\Pi\\ for any real numbers \\\alpha,\beta\\. In R:

``` r
u <- c(2,-1,0)
v <- c(5,0,-1)
P1 <- point(d*nhat)                
P2 <- point(d*nhat + 1.3*u + 3.44*v)
P3 <- point(d*nhat - 6.1*u + 1.02*v)
```

Above we use some made-up values of \\\alpha,\beta\\ to generate `P1`,
`P2`, `P3` which are known to lie in plane \\\Pi\\. Then to verify that
these points lie in the IPNS of \\\Pi\\ we need to take the inner
product with the conformal representation of \\\Pi\\:

``` r
c(drop(Pi %.% P1),drop(Pi %.% P2),drop(Pi %.% P3))
```

    ## [1]  3.191891e-16 -1.110223e-16 -3.330669e-16

Above we see zero (to numerical precision), showing that we do indeed
have \\7\hat{\mathbf{n}} + \alpha\mathbf{u} +
\beta\mathbf{v}\in\operatorname{IPNS}(\Pi)\\ for at least these values
of \\\alpha\\ and \\\beta\\. Alternatively, a plane can be thought of as
a sphere that touches the point at infinity; thus the OPNS of plane is
given by

\\ \pi^\star = P_1\wedge P_2\wedge P_3\wedge\mathbf{e}\_\infty \\

where \\P_1,P_2,P_3\\ are any points that lie in the plane. To
illustrate this we will use the three points used in the IPNS above:

``` r
Pi2 <- P1 ^ P2 ^ P3 ^ einf
```

Then for verification we can create another point known to be in the
plane and check that this is in the OPNS. Below we will use `p4` which
is \\d\hat{\mathbf{n}} + 7.6\mathbf{u} - 9.23\mathbf{v}\\:

``` r
p4 <- point(d*nhat + 7.6*u - 9.23*v)
Mod(Pi2 ^ p4)
```

    ## [1] 3.005929e-13

Above we see a very small result showing that `p4` is indeed in the OPNS
of plane `Pi2`.

## Circle

A circle is defined as the intersection of two spheres:

``` r
circle <- function(S1,S2){  # IPNS
    S1 ^ S2
}
```

For example

``` r
circle(sphere(1:3,5),sphere(c(1.1,2.1,3.4),6))
```

    ## Element of a Clifford algebra, equal to
    ## - 0.1e_12 + 0.1e_13 + 0.5e_23 - 3.31e_14 - 7.22e_24 - 9.33e_34 - 3.41e_15 -
    ## 7.32e_25 - 9.73e_35 + 3.91e_45

A circle may be represented in the OPNS by specifying three points that
lie on it:

\\ Z^\*=P_1\wedge P_2\wedge P_3\\

``` r
circlestar <- function(...){  # OPNS; A^B^C
    jj <- list(...)
    stopifnot(length(jj) == dimension)
    Reduce(`^`,lapply(jj,point))
}

(CIRC <- circlestar(c(1,2,3),c(5,6,3),c(8,8,-2)))
```

    ## Element of a Clifford algebra, equal to
    ## + 8e_123 - 38e_124 - 110e_134 - 54e_234 - 42e_125 - 130e_135 - 74e_235 +
    ## 40e_145 + 68e_245 + 140e_345

verify:

``` r
poc  # point on circle, found numerically [chunk omitted]
```

    ## Element of a Clifford algebra, equal to
    ## - 0.7152127e_1 - 0.2498563e_2 + 0.3267822e_3 - 0.159628e_4 + 0.840372e_5

``` r
poc ^ CIRC
```

    ## Element of a Clifford algebra, equal to
    ## - 0.003402925e_1234 - 0.003402866e_1235 - 0.001701745e_1245 - 0.00850813e_1345
    ## - 0.008507714e_2345

Above we see that `poc` is at least close to the circle from the small
magnitude of the terms in the wedge product.

## Lines and point pairs

A line is the intersection of two planes; in R:

``` r
line <- function(P1,P2){ P1 ^ P2 }
```

and a “point pair” is the intersection of three spheres; in R:

``` r
pointpair <- function(S1,S2,S3){ S1 ^ S2 ^ S3 }
```

It is not at all obvious that three spheres intersect in a pair of
points; and still less obvious that the process is associative. However,
we may verify associativity explicitly:

``` r
S1 <- sphere(c(3,2,4),3)
S2 <- sphere(c(3,1,4),4)
S3 <- sphere(c(1,3,3),3)
(S1^S2)^S3
```

    ## Element of a Clifford algebra, equal to
    ## - 5e_123 + 31e_124 + 25e_134 - 40.5e_234 + 29e_125 + 25e_135 - 39.5e_235 -
    ## 10e_145 + 10e_245 - 5e_345

``` r
(S1^S2)^S3 == S1^(S2^S3)
```

    ## [1] TRUE

### References

Hankin, R. K. S. 2025. “Clifford Algebra in R: Introducing the clifford
Package.” *Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.

Hildenbrand, D. 2013. *Foundations of Geometric Algebra Computing*.
Springer.

Perwass, C. 2009. *Geometric Algebra with Applications in Engineering*.
Springer.
