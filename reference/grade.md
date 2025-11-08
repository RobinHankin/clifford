# The grade of a clifford object

The grade of a term is the number of basis vectors in it.

## Usage

``` r
grade(C, n, drop=TRUE)
grade(C, n) <- value
grades(x)
gradesplus(x)
gradesminus(x)
gradeszero(x)
```

## Arguments

- C, x:

  Clifford object

- n:

  Integer vector specifying grades to extract

- value:

  Replacement value, a numeric vector

- drop:

  Boolean, with default `TRUE` meaning to coerce a constant Clifford
  object to numeric, and `FALSE` meaning not to

## Details

A term is a single expression in a Clifford object. It has a coefficient
and is described by the basis vectors it comprises. Thus \\4e\_{234}\\
is a term but \\e_3 + e_5\\ is not.

The grade of a term is the number of basis vectors in it. Thus the grade
of \\e_1\\ is 1, and the grade of \\e\_{125}=e_1e_2e_5\\ is 3. The grade
operator \\\left\langle\cdot\right\rangle_r\\ is used to extract terms
of a particular grade, with

\$\$ A=\left\langle A\right\rangle_0 + \left\langle A\right\rangle_1 +
\left\langle A\right\rangle_2 + \cdots = \sum_r\left\langle
A\right\rangle_r \$\$

for any Clifford object \\A\\. Thus \\\left\langle A\right\rangle_r\\ is
said to be homogenous of grade \\r\\. Hestenes sometimes writes
subscripts that specify grades using an overbar as in \\\left\langle
A\right\rangle\_{\overline{r}}\\. It is conventional to denote the
zero-grade object \\\left\langle A\right\rangle_0\\ as simply
\\\left\langle A\right\rangle\\.

We have

\$\$ \left\langle A+B\right\rangle_r=\left\langle A\right\rangle_r +
\left\langle B\right\rangle_r\qquad \left\langle\lambda
A\right\rangle_r=\lambda\left\langle A\right\rangle_r\qquad
\left\langle\left\langle A\right\rangle_r\right\rangle_s=\left\langle
A\right\rangle_r\delta\_{rs}. \$\$

Function `grades()` returns an (unordered) vector specifying the grades
of the constituent terms. Function `grades<-()` allows idiom such as
`grade(x,1:2) <- 7` to operate as expected \[here to set all
coefficients of terms with grades 1 or 2 to value 7\].

Function `gradesplus()` returns the same but counting only basis vectors
that square to \\+1\\, and `gradesminus()` counts only basis vectors
that square to \\-1\\. Function
[`signature()`](https://robinhankin.github.io/clifford/reference/signature.md)
controls which basis vectors square to \\+1\\ and which to \\-1\\.

From Perwass, page 57, given a bilinear form

\$\$\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
+x_p^2-x\_{p+1}^2-\cdots -x\_{p+q}^2 \$\$

and a basis blade \\e\_\mathbb{A}\\ with \\A\subseteq\left\lbrace
1,\ldots,p+q\right\rbrace\\, then

\$\$ \mathrm{gr}(e_A) = \left\|\left\lbrace a\in A\colon 1\leqslant
a\leqslant p+q\right\rbrace\right\| \$\$

\$\$ \mathrm{gr}\_{+}(e_A) = \left\|\left\lbrace a\in A\colon 1\leqslant
a\leqslant p\right\rbrace\right\| \$\$

\$\$ \mathrm{gr}\_{-}(e_A) = \left\|\left\lbrace a\in A\colon p \< a\leq
p+q\right\rbrace\right\| \$\$

Function `gradeszero()` counts only the basis vectors squaring to zero
(I have not seen this anywhere else, but it is a logical suggestion).

If the signature is zero, then the Clifford algebra reduces to a
Grassmann algebra and products match the wedge product of exterior
calculus. In this case, functions `gradesplus()` and `gradesminus()`
return `NA`.

Function `grade(C,n)` returns a clifford object with just the elements
of grade `g`, where `g %in% n`.

Idiom like `grade(C,r) <- value`, where `r` is a non-negative integer
(or vector of non-negative integers) should behave as expected. It has
two distinct cases: firstly, where `value` is a length-one numeric
vector; and secondly, where `value` is a clifford object:

- Firstly, `grade(C,r) <- value` with `value` a length-one numeric
  vector. This changes the coefficient of all grade-`r` terms to
  `value`. Note that `disordR` discipline must be respected, so if
  `value` has length exceeding one, a `disordR` consistency error might
  be raised.

- Secondly, `grade(C,r) <- value` with `value` a clifford object. This
  should operate as expected: it will replace the grade-`r` components
  of `C` with `value`. If `value` has any grade component not in `r`, a
  “grade mismatch” error will be returned. Thus, only the grade-`r`
  components of `C` may be modified with this construction. It is semi
  vectorised: if `r` is a vector, it is interpreted as a set of grades
  to replace.

The zero grade term, `grade(C,0)`, is given more naturally by
`const(C)`.

Function
[`c_grade()`](https://robinhankin.github.io/clifford/reference/lowlevel.md)
is a helper function that is documented at `Ops.clifford.Rd`.

## Author

Robin K. S. Hankin

## Note

In the C code, “term” has a slightly different meaning, referring to the
vectors without the associated coefficient.

## See also

[`signature`](https://robinhankin.github.io/clifford/reference/signature.md),
[`const`](https://robinhankin.github.io/clifford/reference/const.md)

## References

C. Perwass 2009. “Geometric algebra with applications in engineering”.
Springer.

## Examples

``` r
a <- clifford(sapply(seq_len(7),seq_len),seq_len(7))
a
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 2e_12 + 3e_123 + 4e_1234 + 5e_12345 + 6e_123456 + 7e_1234567
grades(a)
#> A disord object with hash 185ca524fb71fa2ae28566b137978e475c1aa00f and elements
#> [1] 1 2 3 4 5 6 7
#> (in some order)
grade(a,5)
#> Element of a Clifford algebra, equal to
#> + 5e_12345


a <- clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),1:8)
b <- clifford(list(4,1:2,2:3),c(101,102,103))

grade(a,1) <- 13*e(6)
grade(a,2) <- grade(b,2)
grade(a,0:2) <- grade(b,0:2)*7


signature(2,2)
x <- rcliff()
drop(gradesplus(x) + gradesminus(x) + gradeszero(x) - grades(x))
#>  [1] 0 0 0 0 0 0 0 0 0 0

a <- rcliff()
a == Reduce(`+`,sapply(unique(grades(a)),function(g){grade(a,g)}))
#> [1] TRUE
```
