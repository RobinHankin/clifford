# Random clifford objects

Random Clifford algebra elements, intended as quick “get you going”
examples of `clifford` objects

## Usage

``` r
rcliff(n=9, d=6, g=4, include.fewer=TRUE)
rclifff(n=100, d=20, g=10, include.fewer=TRUE)
rblade(d=7, g=3, prod=TRUE)
```

## Arguments

- n:

  Number of terms

- d:

  Dimensionality of underlying vector space

- g:

  Maximum grade of any term

- include.fewer:

  Boolean, with `FALSE` meaning to return a clifford object comprising
  only terms of grade `g`, and default `TRUE` meaning to include terms
  with grades less than `g` (including a term of grade zero, that is, a
  scalar)

- prod:

  In `rblade()`, Boolean with default `TRUE` meaning to return the
  product of random 1-vectors, and `FALSE` meaning to return a list of
  the 1-vectors

## Details

Function `rcliff()` gives a quick nontrivial Clifford object, typically
with terms having a range of grades (see `grade.Rd`); argument
`include.fewer=FALSE` ensures that all terms are of the same grade.
Function `rclifff()` is the same but returns a more complicated object
by default.

Function `rblade()` gives a Clifford object that is a *blade* (see
`term.Rd`). It returns the wedge product of a number of 1-vectors, for
example \\\left(e_1+2e_2\right)\wedge\left(e_1+3e_5\right)\\.

Perwass gives the following lemma:

Given blades \\A\_{\langle r\rangle}, B\_{\langle s\rangle}, C\_{\langle
t\rangle}\\, then

\$\$ \langle A\_{\langle r\rangle} B\_{\langle s\rangle} C\_{\langle
t\rangle} \rangle_0 = \langle C\_{\langle t\rangle} A\_{\langle
r\rangle} B\_{\langle s\rangle} \rangle_0 \$\$

In the proof he notes in an intermediate step that

\$\$ \langle A\_{\langle r\rangle} B\_{\langle s\rangle} \rangle_t \*
C\_{\langle t\rangle} = C\_{\langle t\rangle} \* \langle A\_{\langle
r\rangle} B\_{\langle s\rangle} \rangle_t = \langle C\_{\langle
t\rangle} A\_{\langle r\rangle} B\_{\langle s\rangle} \rangle_0. \$\$

Package idiom is shown in the examples.

## Author

Robin K. S. Hankin

## Note

If the grade exceeds the dimensionality, \\g\>d\\, then the result is
arguably zero; `rcliff()` returns an error.

## See also

[`term`](https://robinhankin.github.io/clifford/reference/term.html),[`grade`](https://robinhankin.github.io/clifford/reference/grade.md)

## Examples

``` r
rcliff()
#> Element of a Clifford algebra, equal to
#> + 6 - 8e_2 - 7e_13 - 5e_1234 - 2e_6 - 1e_26 + 8e_1236 + 9e_346 + 4e_256 +
#> 5e_1356
rcliff(d=3,g=2)
#> Element of a Clifford algebra, equal to
#> + 6 + 8e_1 - 1e_2 + 2e_12 + 4e_3 - 5e_13 - 8e_23
rcliff(3,10,7)
#> Element of a Clifford algebra, equal to
#> + 3 + 1e_1257 - 2e_79 - 3e_245689
rcliff(3,10,7,include=TRUE)
#> Element of a Clifford algebra, equal to
#> + 3 - 3e_5 - 1e_34567 + 3e_3456710

x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE
#> [1] TRUE


rblade()
#> Element of a Clifford algebra, equal to
#> - 21e_123 - 4e_124 + 1e_134 - 9e_234 - 8e_125 + 2e_135 - 18e_235 + 40e_126 +
#> 32e_136 - 15e_236 + 8e_146 - 20e_246 - 13e_346 + 16e_156 - 40e_256 - 26e_356 -
#> 22e_127 - 5e_137 - 18e_237 - 2e_147 + 6e_247 + 3e_347 - 4e_157 + 12e_257 +
#> 6e_357 - 24e_167 + 50e_267 + 31e_367 - 2e_467 - 4e_567

# We can invert blades easily:
a <- rblade()
ainv <- rev(a)/scalprod(a)

zap(a*ainv)  # 1 (to numerical precision)
#> [1] 1
zap(ainv*a)  # 1 (to numerical precision)
#> [1] 1

# Perwass 2009, lemma 3.9:


A <- rblade(d=9, g=4)
B <- rblade(d=9, g=5)
C <- rblade(d=9, g=6)

grade(A*B*C,0) - grade(C*A*B,0)   # zero to numerical precision
#> [1] 0



# Intermediate step

x1 <- grade(A*B,3) %star% C
x2 <- C %star% grade(A*B,3)
x3 <- grade(C*A*B,0)

max(x1,x2,x3) - min(x1,x2,x3)   # zero to numerical precision
#> [1] 0
```
