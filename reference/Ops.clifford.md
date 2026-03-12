# Arithmetic Ops Group Methods for `clifford` objects

Different arithmetic operators for clifford objects, including many
different types of multiplication.

## Usage

``` r
# S3 method for class 'clifford'
Ops(e1, e2)
clifford_negative(C)
geoprod(C1, C2)
clifford_times_scalar(C, x)
clifford_plus_clifford(C1, C2)
clifford_eq_clifford(C1, C2)
clifford_inverse(C)
cliffdotprod(C1, C2)
fatdot(C1, C2)
lefttick(C1, C2)
righttick(C1, C2)
wedge(C1,C2)
scalprod(C1, C2=rev(C1), drop=TRUE)
eucprod(C1, C2=C1, drop=TRUE)
maxyterm(C1, C2=as.clifford(0))
C1 %.% C2
C1 %dot% C2
C1 %^% C2
C1 %X% C2
C1 %star% C2
C1 % % C2
C1 %euc% C2
C1 %o% C2
C1 %_|% C2
C1 %|_% C2
```

## Arguments

- e1, e2, C, C1, C2:

  Objects of class `clifford` or coerced if needed

- x:

  Scalar, length one numeric vector

- drop:

  Boolean, with default `TRUE` meaning to return the constant coerced to
  numeric, and `FALSE` meaning to return a (constant) Clifford object

## Details

The function `Ops.clifford()` passes unary and binary arithmetic
operators “`+`”, “`-`”, “`*`”, “`/`” and “`^`” to the appropriate
specialist function. Function `maxyterm()` returns the maximum index in
the terms of its arguments.

The package has several binary operators:

|                   |                               |                                                                                                                                                                                      |
|-------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Geometric product | `A*B = geoprod(A,B)`          | \\\displaystyle AB=\sum\_{r,s}\left\langle A\right\rangle_r\left\langle B\right\rangle_s\\                                                                                           |
| Inner product     | `A %.% B = cliffdotprod(A,B)` | \\\displaystyle A\cdot B=\sum\_{r\neq 0\atop s\ne 0}^{\vphantom{s\neq 0}}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle\_{\left\|s-r\right\|}\\ |
| Outer product     | `A %^% B = wedge(A,B)`        | \\\displaystyle A\wedge B=\sum\_{r,s}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle\_{s+r}\\                                                    |
| Fat dot product   | `A %o% B = fatdot(A,B)`       | \\\displaystyle A\bullet B=\sum\_{r,s}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle\_{\left\|s-r\right\|}\\                                    |
| Left contraction  | `A %_|% B = lefttick(A,B)`    | \\\displaystyle A\rfloor B=\sum\_{r,s}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle\_{s-r}\\                                                   |
| Right contraction | `A %|_% B = righttick(A,B)`   | \\\displaystyle A\lfloor B=\sum\_{r,s}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle\_{r-s}\\                                                   |
| Cross product     | `A %X% B = cross(A,B)`        | \\\displaystyle A\times B=\frac{1}{2\_{\vphantom{j}}}\left(AB-BA\right)\\                                                                                                            |
| Scalar product    | `A %star% B = star(A,B)`      | \\\displaystyle A\ast B=\sum\_{r,s}\left\langle\left\langle A\right\rangle_r\left\langle B\right\rangle_s\right\rangle_0\\                                                           |
| Euclidean product | `A %euc% B = eucprod(A,B)`    | \\\displaystyle A\star B= A\ast B^\dagger\\                                                                                                                                          |

In R idiom, the geometric product `geoprod(.,.)` has to be indicated
with a “`*`” (as in `A*B`) and so the binary operator must be `%*%`: we
need a different idiom for scalar product, which is why `%star%` is
used.

Because geometric product is often denoted by juxtaposition, package
idiom includes `a % % b` for geometric product.

Binary operator `%dot%` is a synonym for `%.%`, which causes problems
for rmarkdown.

Function `clifford_inverse()` returns an inverse for nonnull Clifford
objects \\\operatorname{Cl}(p,q)\\ for \\p+q\leq 5\\, and a few other
special cases. The functionality is problematic as nonnull blades always
have an inverse; but function
[`is.blade()`](https://robinhankin.github.io/clifford/reference/term.md)
is not yet implemented. Blades (including null blades) have a
pseudoinverse, but this is not implemented yet either.

The scalar product of two clifford objects is defined as the zero-grade
component of their geometric product:

\$\$ A\ast B=\left\langle AB\right\rangle_0\qquad{\mbox{NB: notation
used by both Perwass and Hestenes}} \$\$

In package idiom the scalar product is given by `A %star% B` or
`scalprod(A,B)`. Hestenes and Perwass both use an asterisk for scalar
product as in “\\A\*B\\”, but in package idiom, the asterisk is reserved
for geometric product.

**Note: in the package, `A*B` is the geometric product**.

The Euclidean product (or Euclidean scalar product) of two clifford
objects is defined as

\$\$ A\star B= A\ast B^\dagger= \left\langle
AB^\dagger\right\rangle_0\qquad{\mbox{Perwass}} \$\$

where \\B^\dagger\\ denotes Conjugate \[as in `Conj(a)`\]. In package
idiom the Euclidean scalar product is given by `eucprod(A,B)` or
`A %euc% B`, both of which return `A * Conj(B)`.

Note that the scalar product \\A\ast A\\ can be positive or negative
\[that is, `A %star% A` may be any sign\], but the Euclidean product is
guaranteed to be non-negative \[that is, `A %euc% A` is always positive
or zero\].

Dorst defines the left and right contraction (Chisholm calls these the
left and right inner product) as \\A\rfloor B\\ and \\A\lfloor B\\. See
the vignette for more details.

Division, as in idiom `x/y`, is defined as `x*clifford_inverse(y)`.
Function `clifford_inverse()` uses the method set out by Hitzer and
Sangwine but is limited to \\p+q\leq 5\\.

The Lie bracket, \\\left\[x,y\right\]\\ is implemented in the package
using idiom such as `.[x,y]`, and this is documented at `dot.Rd`.

Many of the functions documented here use low-level helper functions
that wrap C code. For example, `fatdot()` uses
[`c_fatdotprod()`](https://robinhankin.github.io/clifford/reference/lowlevel.md).
These are documented at `lowlevel.Rd`.

## Value

The high-level functions documented here return a `clifford` object. The
low-level functions are not really intended for the end-user.

## Author

Robin K. S. Hankin

## See also

[`dot`](https://robinhankin.github.io/clifford/reference/dot.md)

## Note

All the different Clifford products have binary operators for
convenience including the wedge product `%^%`. However, as an
experimental facility, the caret “`^`” returns either multiplicative
powers \[as in `A^3=A*A*A`\], or a wedge product \[as in
`A^B = A %^% B = wedge(A,B)`\] depending on the class of the second
argument. I don't see that “`A ^ B`” is at all ambiguous but OTOH I
might withdraw it if it proves unsatisfactory for some reason.

Compare the [stokes](https://CRAN.R-project.org/package=stokes) package,
where multiplicative powers do not really make sense and `A^B` is
interpreted as a wedge product of differential forms \\A\\ and \\B\\. In
[stokes](https://CRAN.R-project.org/package=stokes), the wedge product
is the *sine qua non* for the whole package and needs a terse idiomatic
representation (although there `A%^%B` returns the wedge product too).

**Using `%.%` causes severe and weird difficult-to-debug problems in
markdown documents.**

## References

E. Hitzer and S. Sangwine 2017. “Multivector and multivector matrix
inverses in real Clifford algebras”. *Applied Mathematics and
Computation* 311:375-389

## Examples

``` r
u <- rcliff(5)
v <- rcliff(5)
w <- rcliff(5)

u
#> Element of a Clifford algebra, equal to
#> + 6 + 5e_4 + 4e_5 - 5e_245 - 4e_36
v
#> Element of a Clifford algebra, equal to
#> + 3 - 4e_4 - 2e_125 - 1e_1236 - 3e_46 + 1e_256
u*v
#> Element of a Clifford algebra, equal to
#> - 2 - 12e_12 - 9e_4 - 10e_14 - 12e_34 + 12e_5 - 20e_25 - 12e_125 + 4e_235 +
#> 16e_45 - 15e_245 - 10e_1245 - 15e_6 - 4e_26 - 12e_36 - 6e_1236 - 23e_46 -
#> 16e_346 + 5e_12346 - 9e_256 - 4e_12356 + 12e_456 - 5e_2456 - 5e_13456

u+(v+w) == (u+v)+w            # should be TRUE by associativity of "+"
#> [1] TRUE
u*(v*w) == (u*v)*w            # should be TRUE by associativity of "*"
#> [1] TRUE
u*(v+w) == u*v + u*w          # should be TRUE by distributivity
#> [1] TRUE

# Now if x,y are _vectors_ we have:

x <- as.1vector(sample(5))
y <- as.1vector(sample(5))
x*y == x%.%y + x%^%y
#> [1] TRUE
x %^% y == x %^% (y + 3*x)  
#> [1] TRUE
x %^% y == (x*y-x*y)/2        # should be TRUE 
#> [1] FALSE

#  above are TRUE for x,y vectors (but not for multivectors, in general)


## Inner product "%.%" is not associative:
x <- rcliff(5, g=2)
y <- rcliff(5, g=2)
z <- rcliff(5, g=2)
x %.% (y %.% z) == (x %.% y) %.% z
#> [1] FALSE

## Other products should work as expected:

x %|_% y   ## left contraction
#> Element of a Clifford algebra, equal to
#> + 17 - 20e_1 + 15e_2 + 20e_12 - 4e_3 + 4e_4 + 4e_5 - 16e_45 + 5e_6 - 20e_46
x %_|% y   ## right contraction
#> Element of a Clifford algebra, equal to
#> + 17 - 12e_1 - 16e_2 + 4e_4 - 3e_5 + 12e_35
x %o% y    ## fat dot product
#> Element of a Clifford algebra, equal to
#> + 17 - 32e_1 - 1e_2 + 20e_12 - 4e_3 + 8e_4 + 1e_5 + 12e_35 - 16e_45 + 5e_6 -
#> 20e_46
x ^ y        ## Experimental wedge product idiom, plain caret
#> Element of a Clifford algebra, equal to
#> + 16 - 12e_1 - 16e_2 + 20e_12 - 4e_3 - 3e_13 - 4e_23 + 8e_4 + 3e_14 + 4e_24 +
#> 5e_124 - 1e_34 + 12e_35 + 15e_1235 - 16e_45 + 12e_145 + 16e_245 - 3e_345 -
#> 20e_46 + 15e_146 + 20e_246 + 15e_3456
```
