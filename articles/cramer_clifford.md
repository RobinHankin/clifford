# Cramer's rule in civilised form with Clifford algebra

![](../../../_temp/Library/clifford/help/figures/clifford.png)

To cite the `clifford` package in publications please use Hankin
([2025](#ref-hankin2025_clifford_rmd)). This short document shows a nice
application of Clifford algebras to linear algebra. Suppose we have
vectors \\{\mathbf a}, {\mathbf b}, {\mathbf c}\\ spanning
\\\mathbb{R}^3\\ and are given \\{\mathbf x}\in\mathbb{R}^3\\. We wish
to write \\{\mathbf x}=\alpha {\mathbf a}+\beta {\mathbf b}+\gamma
{\mathbf c}\\ for some \\\alpha,\beta,\gamma\in\mathbb{R}\\. The
traditional Cramer’s rule for finding \\\alpha,\beta,\gamma\\ would be

\\ \alpha=\frac{ \det\begin{bmatrix} x_1&b_1&c_1\\ x_2&b_2&c_2\\
x_3&b_3&c_3 \end{bmatrix} }{ \det\begin{bmatrix} a_1&b_1&c_1\\
a_2&b_2&c_2\\ a_3&b_3&c_3 \end{bmatrix} } \qquad\beta=\frac{
\det\begin{bmatrix} a_1&x_1&c_1\\ a_2&x_2&c_2\\ a_3&x_3&c_3
\end{bmatrix} }{ \det\begin{bmatrix} a_1&b_1&c_1\\ a_2&b_2&c_2\\
a_3&b_3&c_3 \end{bmatrix} } \qquad \gamma=\frac{ \det\begin{bmatrix}
a_1&b_1&x_1\\ a_2&b_2&x_2\\ a_3&b_3&x_3 \end{bmatrix} }{
\det\begin{bmatrix} a_1&b_1&c_1\\ a_2&b_2&c_2\\ a_3&b_3&c_3
\end{bmatrix} } \\

where \\{\mathbf x}=(x_1,x_2,x_3)^T\\, \\{\mathbf a}=(a_1,a_2,a_3)^T\\,
\\{\mathbf b}=(b_1,b_2,b_3)^T\\ and \\{\mathbf c}=(c_1,c_2,c_3)^T\\.
However, observe that this solution, while accurate, requires one to
take a coordinate basis; and offers little in the way of intuition.

### Using Clifford algebra

Considering \\\mathbb{R}^3\\ as a vector space and given vectors
\\{\mathbf a}, {\mathbf b}, {\mathbf c}\\ spanning the space we can
express any vector \\{\mathbf x}\in\mathbb{R}^3\\ as

\\\mathbf{x}= \left(\frac{{\mathbf x}\wedge{\mathbf b}\wedge{\mathbf
c}}{{\mathbf a}\wedge{\mathbf b}\wedge{\mathbf c}}\right){\mathbf a}+
\left(\frac{{\mathbf a}\wedge{\mathbf x}\wedge{\mathbf c}}{{\mathbf
a}\wedge{\mathbf b}\wedge{\mathbf c}}\right){\mathbf b}+
\left(\frac{{\mathbf a}\wedge{\mathbf b}\wedge{\mathbf x}}{{\mathbf
a}\wedge{\mathbf b}\wedge{\mathbf c}}\right){\mathbf c} \\

which is Cramer’s rule expressed directly in vector form (rather than
components). Observe that the numerator and denominator of each
bracketed term is a pseudoscalar; the ratio of two pseudoscalars is an
ordinary scalar. Package idiom is straightforward:

``` r
a <- as.1vector(runif(3))
b <- as.1vector(runif(3))
c <- as.1vector(runif(3))

(x <- as.1vector(1:3))
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3

``` r
options(maxdim = 3)  # needed to drop() pseudoscalars
abc <- drop(a ^ b ^ c)

alpha <- drop(x ^ b ^ c)/abc
beta  <- drop(a ^ x ^ c)/abc
gamma <- drop(a ^ b ^ x)/abc

c(alpha,beta,gamma)
```

    ## [1] -3.805997 -5.328439  8.309581

``` r
alpha*a + beta*b + gamma*c
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3

``` r
Mod(alpha*a + beta*b + gamma*c-x)
```

    ## [1] 0

Thus we have expressed \\{\mathbf x}\\ (except for possible roundoff
error) as a linear combination of \\{\mathbf a},{\mathbf b},{\mathbf
c}\\, specifically \\{\mathbf x}=\alpha{\mathbf a}+\beta{\mathbf
b}+\gamma{\mathbf c}\\. Conversely, we might know the coefficients and
try to determine them using package idiom. Here we will use \\1,2,3\\
and suppose that \\{\mathbf y}=1{\mathbf a}+2{\mathbf b}+3{\mathbf c}\\:

``` r
y <- a*1 + b*2 + c*3
c(
    drop(y ^ b ^ c)/abc,
    drop(a ^ y ^ c)/abc,
    drop(a ^ b ^ y)/abc
)
```

    ## [1] 1 2 3

## Higher dimensional space

To accomplish this in arbitrary-dimensional space is straightforward.
Here we consider \\\mathbb{R}^{5}\\:

``` r
n <- 5                                                 # dimensionality of space
options(maxdim=5)                                      # safety precaution
x <- as.1vector(seq_len(n))                            # target vector
x
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3 + 4e_4 + 5e_5

``` r
L <- replicate(n,as.1vector(rnorm(n)),simplify=FALSE)  # spanning vectors
subst <- function(L,n,x){L[[n]] <- x; return(L)}       # list substitution
coeff <- function(n,L,x){
      drop(Reduce(`^`,subst(L,n,x))/Reduce(`^`,L))
}
```

Then the coefficients are given by:

``` r
(alpha <- sapply(seq_len(n),coeff,L,x))
```

    ## [1]  21.610237  27.030973  11.866383 -22.222116   3.199427

and we can reconstitute vector \\x\\:

``` r
out <- as.clifford(0)
f <- function(i){alpha[i]*L[[i]]}
for(i in seq_len(n)){
      out <- out + f(i)
}
Mod(out-x)  # zero to numerical precision
```

    ## [1] 2.340649e-14

Or, somewhat slicker:

``` r
Reduce(`+`,sapply(seq_len(n),f,simplify=FALSE))
```

    ## Element of a Clifford algebra, equal to
    ## + 1e_1 + 2e_2 + 3e_3 + 4e_4 + 5e_5

Conversely, if we know the coefficients are, say, `15:11`, then we would
have

``` r
coeffs <- 15:11
x <- 0
for(i in seq_len(5)){x <- x + coeffs[i]*L[[i]]}
x
```

    ## Element of a Clifford algebra, equal to
    ## + 29.23618e_1 + 18.68409e_2 + 20.23065e_3 - 0.6361232e_4 - 40.82507e_5

And then to find the coefficients:

``` r
sapply(seq_len(n),coeff,L,x)
```

    ## [1] 15 14 13 12 11

Above we see that the original coefficients are recovered, up to
numerical accuracy.

### References

Hankin, R. K. S. 2025. “Clifford Algebra in R: Introducing the clifford
Package.” *Advances in Applied Clifford Algebra* 35 (51).
https://doi.org/<https://doi.org/10.1007/s00006-025-01403-9>.
