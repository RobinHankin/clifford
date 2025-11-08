# Coercion from numeric to Clifford form

Given a numeric value or vector, return a Clifford algebra element

## Usage

``` r
numeric_to_clifford(x)
as.1vector(x)
is.1vector(x)
scalar(x=1)
as.scalar(x=1)
is.scalar(C)
basis(n, x=1)
e(n, x=1)
```

## Arguments

- x:

  Numeric vector

- n:

  Integer specifying dimensionality of underlying vector space

- C:

  Object possibly of class Clifford

## Details

Function `as.scalar()` takes a length-one numeric vector and returns a
Clifford scalar of that value (to extract the scalar component of a
multivector, use
[`const()`](https://robinhankin.github.io/clifford/reference/const.md)).

Function `is.scalar()` is a synonym for
[`is.real()`](https://robinhankin.github.io/clifford/reference/const.md)
which is documented at `const.Rd`.

Function `as.1vector()` takes a numeric vector and returns the linear
sum of length-one blades with coefficients given by `x`; function
`is.1vector()` returns `TRUE` if every term is of grade 1.

Function `numeric_to_vector()` dispatches to either `as.scalar()` for
length-one vectors or `as.1vector()` if the length is greater than one.

Function `basis()` returns a wedge product of basis vectors; function
`e()` is a synonym. There is special dispensation for zero, so `e(0)`
returns the Clifford scalar 1.

Function
[`antivector()`](https://robinhankin.github.io/clifford/reference/antivector.md)
should arguably be described here but is actually documented at
`antivector.Rd`.

## Author

Robin K. S. Hankin

## See also

[`getcoeffs`](https://robinhankin.github.io/clifford/reference/Extract.md),[`antivector`](https://robinhankin.github.io/clifford/reference/antivector.md),[`const`](https://robinhankin.github.io/clifford/reference/const.md),[`pseudoscalar`](https://robinhankin.github.io/clifford/reference/pseudoscalar.md)

## Examples

``` r
as.scalar(6)
#> Element of a Clifford algebra, equal to
#> scalar ( 6 )
as.1vector(1:8)
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 2e_2 + 3e_3 + 4e_4 + 5e_5 + 6e_6 + 7e_7 + 8e_8

e(5:8)
#> Element of a Clifford algebra, equal to
#> + 1e_5678

Reduce(`+`,sapply(seq_len(7),function(n){e(seq_len(n))},simplify=FALSE))
#> Element of a Clifford algebra, equal to
#> + 1e_1 + 1e_12 + 1e_123 + 1e_1234 + 1e_12345 + 1e_123456 + 1e_1234567

```
