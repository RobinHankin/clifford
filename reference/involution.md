# Clifford involutions

An involution is a function that is its own inverse, or equivalently
\\f(f(x))=x\\. There are several important involutions on Clifford
objects; these commute past the grade operator with \\f(\left\langle
A\right\rangle_r)=\left\langle f(A)\right\rangle_r\\ and are linear:
\\f(\alpha A+\beta B)=\alpha f(A)+\beta f(B)\\.

The dual is documented here for convenience, even though it is not an
involution (applying the dual *four* times is the identity).

- The reverse \\A^\sim\\ is given by `rev()` (both Perwass and Dorst use
  a tilde, as in \\\tilde{A}\\ or \\A^\sim\\. However, both Hestenes and
  Chisholm use a dagger, as in \\A^\dagger\\. This page uses Perwass's
  notation). The reverse of a term written as a product of basis vectors
  is simply the product of the same basis vectors but written in reverse
  order. This changes the sign of the term if the number of basis
  vectors is 2 or 3 (modulo 4). Thus, for example,
  \\\left(e_1e_2e_3\right)^\sim=e_3e_2e_1=-e_1e_2e_3\\ and
  \\\left(e_1e_2e_3e_4\right)^\sim=e_4e_3e_2e_1=+e_1e_2e_3e_4\\.
  Formally, if \\X=e\_{i_1}\ldots e\_{i_k}\\, then
  \\\tilde{X}=e\_{i_k}\ldots e\_{i_1}\\.

  \$\$\left\langle A^\sim\right\rangle_r=\widetilde{\left\langle
  A\right\rangle_r}=(-1)^{r(r-1)/2}\left\langle A\right\rangle_r \$\$

  Perwass shows that \\\left\langle
  AB\right\rangle_r=(-1)^{r(r-1)/2}\left\langle\tilde{B}\tilde{A}\right\rangle_r
  \\

- The Conjugate \\A^\dagger\\ is given by `Conj()` (we use Perwass's
  notation, def 2.9 p59). This depends on the signature of the Clifford
  algebra; see `grade.Rd` for notation. Given a basis blade
  \\e\_\mathbb{A}\\ with \\\mathbb{A}\subseteq\left\lbrace
  1,\ldots,p+q\right\rbrace\\, then we have \\e\_\mathbb{A}^\dagger =
  (-1)^m {e\_\mathbb{A}}^\sim\\, where
  \\m=\mathrm{gr}\_{-}(\mathbb{A})\\. Alternatively, we might say
  \$\$\left(\left\langle
  A\right\rangle_r\right)^\dagger=(-1)^m(-1)^{r(r-1)/2}\left\langle
  A\right\rangle_r \$\$ where \\m=\mathrm{gr}\_{-}(\left\langle
  A\right\rangle_r)\\ \[NB I have changed Perwass's notation\].

- The main (grade) involution or grade involution \\\widehat{A}\\ is
  given by `gradeinv()`. This changes the sign of any term with odd
  grade:

  \$\$\widehat{\left\langle A\right\rangle_r} =(-1)^r\left\langle
  A\right\rangle_r\$\$

  (I don't see this in Perwass or Hestenes; notation follows Hitzer and
  Sangwine). It is a special case of grade negation.

- The grade \\r\\-negation \\A\_{\overline{r}}\\ is given by `neg()`.
  This changes the sign of the grade \\r\\ component of \\A\\. It is
  formally defined as \\A-2\left\langle A\right\rangle_r\\ but function
  `neg()` uses a more efficient method. It is possible to negate all
  terms with specified grades, so for example we might have
  \\\left\langle A\right\rangle\_{\overline{\left\lbrace
  1,2,5\right\rbrace}} = A-2\left( \left\langle A\right\rangle_1
  +\left\langle A\right\rangle_2+\left\langle A\right\rangle_5\right)\\
  and the R idiom would be `neg(A,c(1,2,5))`. Note that Hestenes uses
  “\\A\_{\overline{r}}\\” to mean the same as \\\left\langle
  A\right\rangle_r\\.

- The Clifford conjugate \\\overline{A}\\ is given by `cliffconj()`. It
  is distinct from conjugation \\A^\dagger\\, and is defined in Hitzer
  and Sangwine as

  \$\$\overline{\left\langle A\right\rangle_r} =
  (-1)^{r(r+1)/2}\left\langle A\right\rangle_r.\$\$

- The dual \\C^\*\\ of a clifford object \\C\\ is given by `dual(C,n)`;
  argument `n` is the dimension of the underlying vector space. Perwass
  gives \\C^\*=CI^{-1}\\

  where \\I=e_1e_2\ldots e_n\\ is the unit pseudoscalar \[note that
  Hestenes uses \\I\\ to mean something different\]. The dual is
  sensitive to the signature of the Clifford algebra *and* the dimension
  of the underlying vector space.

## Usage

``` r
# S3 method for class 'clifford'
rev(x)
# S3 method for class 'clifford'
Conj(z)
cliffconj(z)
neg(C,n)
gradeinv(C)
```

## Arguments

- C,x,z:

  Clifford object

- n:

  Integer vector specifying grades to be negated in `neg()`

## Author

Robin K. S. Hankin

## See also

[`grade`](https://robinhankin.github.io/clifford/reference/grade.md)

## Examples

``` r
x <- rcliff()
x
#> Element of a Clifford algebra, equal to
#> + 4 - 1e_12 - 2e_3 + 2e_1234 - 8e_5 - 5e_1235 - 3e_2345 + 3e_16 + 1e_26
rev(x)
#> Element of a Clifford algebra, equal to
#> + 4 + 1e_12 - 2e_3 + 2e_1234 - 8e_5 - 5e_1235 - 3e_2345 - 3e_16 - 1e_26


A <- rblade(g=3)
B <- rblade(g=4)
rev(A %^% B) == rev(B) %^% rev(A)  # should be TRUE
#> [1] TRUE
rev(A * B) == rev(B) * rev(A)          # should be TRUE
#> [1] TRUE

options(maxdim=8)
a <- rcliff(d=8)
dual(dual(dual(dual(a,8),8),8),8) == a # should be TRUE
#> [1] FALSE
options(maxdim=NULL) # restore default
```
