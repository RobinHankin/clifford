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
#> + 6 - 9e_2 + 9e_5 + 7e_25 + 1e_136 - 1e_46 + 8e_146 - 6e_1346 + 3e_3456
rcliff(d=3,g=2)
#> Element of a Clifford algebra, equal to
#> + 7 - 4e_1 + 6e_2 + 3e_12 - 7e_3 - 8e_13 + 9e_23
rcliff(3,10,7)
#> Element of a Clifford algebra, equal to
#> + 3 - 1e_257 + 1e_1234510 - 3e_345610
rcliff(3,10,7,include=TRUE)
#> Element of a Clifford algebra, equal to
#> + 3 + 3e_1246710 - 1e_13457910 + 1e_18910

x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE
#> [1] TRUE


rblade()
#> Element of a Clifford algebra, equal to
#> + 64e_123 - 32e_124 - 82e_134 + 12e_234 - 16e_125 - 11e_135 + 50e_235 - 15e_145
#> - 22e_245 - 62e_345 - 12e_136 + 8e_236 + 6e_146 - 4e_246 - 8e_346 + 3e_156 -
#> 2e_256 + 8e_356 - 6e_456 + 16e_127 - 25e_137 + 38e_237 + 33e_147 - 22e_247 -
#> 44e_347 + 9e_157 - 22e_257 + 13e_357 - 33e_457 + 3e_167 - 2e_267 - 4e_367 +
#> 3e_567

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
