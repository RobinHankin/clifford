# Lorentz transforms via Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)![](../../../_temp/Library/jordan/help/figures/jordan.png)![](../../../_temp/Library/quadform/help/figures/quadform.png)

To cite the `clifford` package in publications please use Hankin
([2025a](#ref-hankin2025_clifford_rmd)). In this short document I show
how Clifford algebra may be used to effect Lorentz transforms, and
showcase the `clifford` R package. Throughout, we use units in which
\\c=1\\. Notation follows Snygg ([2010](#ref-snygg2010)). Consider the
following four-vector:

``` r
(fourvec <- c(1,5,3,2))  # a four-vector
```

    ## [1] 1 5 3 2

``` r
u <- c(0.2,0.3,0.4)  # a three-velocity
```

We wish to consider the effect of a Lorentz transformation of `s`. This
is done by the `boost()` function of the `lorentz` package ([Hankin
2025b](#ref-hankin2025_lorentz)):

``` r
(Bmat <- boost(u))  # Bmat = "B-matrix"
```

    ##            t           x           y           z
    ## t  1.1867817 -0.23735633 -0.35603450 -0.47471266
    ## x -0.2373563  1.02576299  0.03864448  0.05152597
    ## y -0.3560345  0.03864448  1.05796672  0.07728896
    ## z -0.4747127  0.05152597  0.07728896  1.10305195

The transformation itself is simply matrix multiplication:

``` r
Bmat %*% fourvec
```

    ##        [,1]
    ## t -2.017529
    ## x  5.110444
    ## y  3.165666
    ## z  2.220888

We will effect this operation using Clifford algebra. Conceptually I am
following Snygg but using a somewhat modified notation for consistency
with the `clifford` and `lorentz` packages.

## Lorentz transforms in terms of rapidity

The general form for a Lorentz transform of speed \\u\\ in the
\\x\\-direction is

\\ \begin{pmatrix} \overline{t}\\ \overline{x} \end{pmatrix} =
\begin{pmatrix} \gamma&-\gamma v\\ -\gamma v&\gamma \end{pmatrix}
\begin{pmatrix} t\\x\end{pmatrix} \\

where \\\gamma=(1-u^2)^{-1/2}\\. Writing \\\cosh\phi=\gamma\\ and noting
that \\\phi\\ is real (sometimes \\\phi\\ is known as the *rapidity*) we
get

\\ \begin{pmatrix} \cosh\phi&-\sinh\phi\\ -\sinh\phi &\cosh\phi
\end{pmatrix} \\ for the transformation, and we can see that the matrix
has unit determinant.

## Lorentz transforms in Clifford algebra

Above we considered the four-vector \\s=(1,5,3,2)\\. In Clifford
formalism this appears as

``` r
(scliff <- as.1vector(fourvec))
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 5e_2 + 3e_3 + 2e_4

Algebraically this would be
\\1\mathbf{e}\_1+5\mathbf{e}\_2+3\mathbf{e}\_3+2\mathbf{e}\_4\\ (Snygg
would write
\\1\mathbf{e}\_0+5\mathbf{e}\_1+3\mathbf{e}\_2+2\mathbf{e}\_3\\; we
cannot use that notation here because basis vectors are numbered from 1
in the package, not zero). Also note that the vectors appear in
implementation-specific order, as per `disordR` discipline ([Hankin
2022](#ref-hankin2022_disordR)). The metric would be

\\ \begin{pmatrix} 1&0&0&0\\ 0&-1&0&0\\ 0&0&-1&0\\ 0&0&0&-1
\end{pmatrix} \\

\[NB in relativity, the word “signature” refers to the eigenvalues of
the metric, so the signature of the above matrix would be \\(1,3)\\ \[or
sometimes \\{+}{-}{-}{-}\\\], because it has one positive and three
negative eigenvalues. In package idiom, “signature” means the number of
basis vectors that square to \\+1\\ and \\-1\\, so we would implement
this metric using a signature of \\(1,3)\\\].

The squared interval for our four-vector would be given by

``` r
M <- diag(c(1,-1,-1,-1))
t(fourvec) %*% M %*% fourvec
```

    ##      [,1]
    ## [1,]  -37

We might use the slightly slicker and more efficient idiom `quad.form()`
from the `quadform` package:

``` r
quad.form(M,fourvec)
```

    ##      [,1]
    ## [1,]  -37

The Clifford equivalent would be
[`scalprod()`](https://robinhankin.github.io/clifford/reference/Ops.clifford.md)
\[remembering to set the signature to 1\]:

``` r
signature(1,3)
scalprod(scliff,scliff)
```

    ## [1] -37

We seek a boost \\B\in{\mathcal C}\_{1,3}\\ such that
\\\overline{s}=B^{-1}sB\\ (juxtaposition indicating geometric product).
We will start with a boost in the \\x\\-direction with rapidity
\\\phi\\. This would be \\B=\cosh(\phi/2)+{\mathbf
e}\_{12}\sinh(\phi/2)\\. We note that \\B^{-1}=\cosh(\phi/2)-{\mathbf
e}\_{12}\sinh(\phi/2)\\. Numerically:

``` r
phi <- 2.1234534   # just a made-up random value
B <- cosh(phi/2) + sinh(phi/2)*e(1:2) 
Binv <- rev(B) # cosh(phi/2)- sinh(phi/2)*e(1:2)
B*Binv
```

    ## Element of a Clifford algebra, equal to
    ## scalar ( 1 )

We may verify that rapidities add:

``` r
B <- function(phi){cosh(phi/2) + sinh(phi/2)*e(1:2)}
B(0.26) * B(1.33)
```

    ## Element of a Clifford algebra, equal to
    ## + 1.333011 + 0.8814299e_12

``` r
B(0.26 + 1.33) # should match
```

    ## Element of a Clifford algebra, equal to
    ## + 1.333011 + 0.8814299e_12

We may formally write \\B=\exp({\mathbf e}\_{12}\phi/2)\\ on the grounds
that

\\ \begin{eqnarray} \exp({\mathbf e}\_{12}x) &=&1+\mathbf{e}\_{12}x +
\frac{(\mathbf{e}\_{12}x)^2}{2!} +
\frac{(\mathbf{e}\_{12}x)^3}{3!}+\frac{(\mathbf{e}\_{12}x)^4}{4!}+\cdots\\
&=& (1+x^2/2+x^4/4!+\cdots) +
\mathbf{e}\_{12}(x+\frac{x^3}{3!}+\cdots)\\ &=& \cosh x +
\mathbf{e}\_{12}\sinh x \end{eqnarray} \\

and note that this exponential obeys the usual rules for the regular
exponential function \\e^x,x\in\mathbb{R}\\. More generally, if we have
a transform of rapidity \\\phi\\ and direction cosines \\k_x,k_y,k_z\\
then the transform would be

\\ B\_{xyz}= \cosh(\phi/2) +k_x\mathbf{e}\_{12}\sinh(\phi/2)
+k_y\mathbf{e}\_{13}\sinh(\phi/2) +k_z\mathbf{e}\_{14}\sinh(\phi/2) \\

and we can use standard Clifford algebra (together with the fact that
\\k_x^2+k_y^2+k_z^2=1\\) to demonstrate the transformations.
Numerically:

``` r
B3 <- function(phi,k){cosh(phi/2) + (
     +k[1]*sinh(phi/2)*e(c(1,2))
     +k[2]*sinh(phi/2)*e(c(1,3))
     +k[3]*sinh(phi/2)*e(c(1,4))
   )}
k <- function(kx,ky){c(kx, ky, sqrt(1-kx^2-ky^2))}
kx <- +0.23
ky <- -0.38


k1 <- k(kx=0.23, ky=-0.38)
sum(k1^2) # verify; should be = 1
```

    ## [1] 1

``` r
zap(B3(0.3,k1)*B3(1.9,k1))  # zap() kills terms with small coefficients
```

    ## Element of a Clifford algebra, equal to
    ## + 1.668519 + 0.3071989e_12 - 0.507546e_13 + 1.196654e_14

``` r
zap(B3(0.3+1.9,k1)) # should match previous line (up to numerical accuracy)
```

    ## Element of a Clifford algebra, equal to
    ## + 1.668519 + 0.3071989e_12 - 0.507546e_13 + 1.196654e_14

But if the two boosts have different direction cosines, the result is
more complicated:

``` r
k2 <- k(-0.5,0.1)
zap(B3(2.4,k1) * B3(1.9,k2))
```

    ## Element of a Clifford algebra, equal to
    ## + 3.716216 - 0.479412e_12 - 0.653413e_13 + 0.277158e_23 + 3.722481e_14 -
    ## 1.071824e_24 + 0.691205e_34

Above, we see new terms not present in the pure boosts which correspond
to rotation.

Now we consider a general four-vector
\\s=s^1\mathbf{e}\_1+s^2\mathbf{e}\_2+s^3\mathbf{e}\_3+s^4\mathbf{e}\_4\\
and calculate \\B^{-1}sB\\. This is made easier if we use the facts that
\\\mathbf{e}\_{12}\\ commutes with \\\mathbf{e}\_3\\ and
\\\mathbf{e}\_4\\ as well as scalars, and anticommutes with
\\\mathbf{e}\_1\\ and \\\mathbf{e}\_2\\. Noting that
\\\exp(\mathbf{e}\_{12})\\ is a linear combination of a scalar and
\\\mathbf{e}\_{12}\\ we have

\\ \begin{eqnarray} B^{-1}sB &=&
\exp(-\mathbf{e}\_{12}\phi/2)(s^1\mathbf{e}\_1+s^2\mathbf{e}\_2+s^3\mathbf{e}\_3+s^4\mathbf{e}\_4)\exp(\mathbf{e}\_{12}\phi/2)\\
&=&
(\mathbf{e}\_1s^1+\mathbf{e}\_2s^2)\exp(\mathbf{e}\_{12}\phi/2)\exp(\mathbf{e}\_{12}\phi/2)+\mathbf{e}\_3s^3 +
\mathbf{e}\_4s^4\\ &=&
\mathbf{e}\_1(s^1\cosh\phi-s^2\sinh\phi)+\mathbf{e}\_2(s^2\cosh\phi-s^1\sinh\phi)
+\mathbf{e}\_3s^3+\mathbf{e}\_4s^4 \end{eqnarray}\\

as required (it matches the matrix version). If we have two boosts
\\B_1\\ and \\B_2\\ then the combined boost is either \\B_1B_2\\ (for
\\B_1\\ followed by \\B_2\\) or \\B_2B_1\\ (for \\B_2\\ followed by
\\B_1\\). Numerical methods are straightforward as I will demonstrate
below.

## Numerical methods: Lorentz transforms using the Clifford package

Above we considered boost `Bmat`, and here I will show the effect of
this boost in terms of Clifford objects, using a specialist function
`f()`:

``` r
f <- function(u){
    phi <- acosh(gam(u))               # rapidity
    k <- cosines(u)                    # direction cosines
    return(
           cosh(phi/2)                 # t
    + k[1]*sinh(phi/2)*basis(c(1,2))   # x
    + k[2]*sinh(phi/2)*basis(c(1,3))   # y
    + k[3]*sinh(phi/2)*basis(c(1,4))   # z
    )
}
```

Thus we can express the Lorentz transform as a Clifford object:

``` r
u <- as.3vel(-c(0.2,0.3,0.4))  # negative (passive transform)
options(digits=5)
(B <- f(u))
```

    ## Element of a Clifford algebra, equal to
    ## + 1.0457 - 0.1135e_12 - 0.17025e_13 - 0.22699e_14

The first thing to do is to verify that the inverse of `B` behaves as
expected:

``` r
B*rev(B)
```

    ## Element of a Clifford algebra, equal to
    ## scalar ( 1 )

Then we can apply the transformation \\\overline{s}=B^{-1}sB\\:

``` r
zap(rev(B)*scliff*B)
```

    ## Element of a Clifford algebra, equal to
    ## - 2.0175e_1 + 5.1104e_2 + 3.1657e_3 + 2.2209e_4

Comparing with the result from the `lorentz` package

``` r
Bmat %*% fourvec
```

    ##      [,1]
    ## t -2.0175
    ## x  5.1104
    ## y  3.1657
    ## z  2.2209

we see agreement to within numerical precision. We can further verify
that the squared interval is unchanged:

``` r
jj <- rev(B)*scliff*B
scalprod(jj,jj)
```

    ## [1] -37

matching the untransformed square interval.

## Multiple boosts

Successive Lorentz boosts can induce a rotation as well as a
translation.

``` r
u <- as.3vel(c(0.2, 0.3,  0.4))
v <- as.3vel(c(0.5, 0.0, -0.4))
w <- as.3vel(c(0.0, 0.7,  0.1))
Buvw <- f(u)*f(v)*f(w)
zap(Buvw)
```

    ## Element of a Clifford algebra, equal to
    ## + 1.2914 + 0.45284e_12 + 0.69409e_13 - 0.14103e_23 + 0.07821e_14 + 0.07767e_24
    ## + 0.02902e_34 - 0.04011e_1234

In the above, note that Clifford object `Buvw` has a nonzero scalar
component, and also a nonzero `e_1234` component. However, it represents
a consistent Lorentz transformation:

``` r
zap(Buvw*rev(Buvw))
```

    ## [1] 1

We can now apply this transform to a four-velocity:

``` r
n <- as.1vector(c(1,0,0,0))
zap(rev(Buvw) * n * Buvw)
```

    ## Element of a Clifford algebra, equal to
    ## + 2.3891e_1 + 0.98367e_2 + 1.9312e_3 + 0.10269e_4

## Algebra of Clifford representations

We can shed some light on this representation of Lorentz transforms as
follows:

``` r
signature(1,3)
L <- list(
    C     = basis(numeric()),
    e12   = basis(c(1,2)), e13 = basis(c(1,3)),
    e14   = basis(c(1,4)), e23 = basis(c(2,3)),
    e24   = basis(c(2,4)), e34 = basis(c(3,4)),
    e1234 = basis(1:4)
) 

out <- noquote(matrix("",8,8))
rownames(out) <- names(L)
colnames(out) <- names(L)
for(i in 1:8){
  for(j in 1:8){
    out[i,j] <- gsub('[_ ]','',as.character(L[[i]]*L[[j]]))
  }
}
options("width" = 110)
out
```

    ##       C       e12     e13     e14     e23     e24     e34     e1234  
    ## C     1       +1e12   +1e13   +1e14   +1e23   +1e24   +1e34   +1e1234
    ## e12   +1e12   1       -1e23   -1e24   -1e13   -1e14   +1e1234 +1e34  
    ## e13   +1e13   +1e23   1       -1e34   +1e12   -1e1234 -1e14   -1e24  
    ## e14   +1e14   +1e24   +1e34   1       +1e1234 +1e12   +1e13   +1e23  
    ## e23   +1e23   +1e13   -1e12   +1e1234 -1      +1e34   -1e24   -1e14  
    ## e24   +1e24   +1e14   -1e1234 -1e12   -1e34   -1      +1e23   +1e13  
    ## e34   +1e34   +1e1234 +1e14   -1e13   +1e24   -1e23   -1      -1e12  
    ## e1234 +1e1234 +1e34   -1e24   +1e23   -1e14   +1e13   -1e12   -1

Thus we can see, for example, that `e12*e13 = -e23` and
`e13*e12 = +e23`.

## References

Hankin, R. K. S. 2022. “Disordered vectors in R: introducing the
`disordR` package.” arXiv, <https://arxiv.org/abs/2210.03856>; arXiv.
<https://doi.org/10.48550/ARXIV.2210.03856>.

———. 2025a. “Clifford Algebra in R: Introducing the clifford Package.”
*Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.

———. 2025b. “Special Relativity in R: The Lorentz Package.” *Journal of
Open Source Education* 8 (88): 196.
<https://doi.org/10.21105/jose.00196>.

Snygg, J. 2010. *A New Approach to Differential Geometry Using
Clifford’s Geometric Algebra*. Birkhäuser.
