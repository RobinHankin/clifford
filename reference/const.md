# The constant term of a Clifford object

Get and set the constant term of a clifford object.

## Usage

``` r
const(C,drop=TRUE)
is.real(C)
# S3 method for class 'clifford'
const(x) <- value
```

## Arguments

- C, x:

  Clifford object

- value:

  Replacement value

- drop:

  Boolean, with default `TRUE` meaning to return the constant coerced to
  numeric, and `FALSE` meaning to return a (constant) Clifford object

## Details

Extractor method for specific terms. Function `const()` returns the
constant element of a Clifford object. Note that `const(C)` returns the
same as `grade(C,0)`, but is faster. If `C` is a numeric vector, the
first element is returned: any other elements are silently discarded,
but this may change in future.

The R idiom in `const<-()` is slightly awkward:

    > body(`const<-.clifford`)
    {
      stopifnot(length(value) == 1)
      x <- x - const(x)
      return(x + value)
    }

The reason that it is not simply `return(x-const(x)+value)` or
`return(x+value-const(x))` is to ensure numerical accuracy; see
examples.

## Author

Robin K. S. Hankin

## See also

[`grade`](https://robinhankin.github.io/clifford/reference/grade.md),
[`clifford`](https://robinhankin.github.io/clifford/reference/clifford.md),
[`getcoeffs`](https://robinhankin.github.io/clifford/reference/Extract.md),
[`is.zero`](https://robinhankin.github.io/clifford/reference/zero.md)

## Examples

``` r
X <- clifford(list(1,1:2,1:3,3:5), 6:9)
X
#> Element of a Clifford algebra, equal to
#> + 6e_1 + 7e_12 + 8e_123 + 9e_345
X <- X + 1e300
X
#> Element of a Clifford algebra, equal to
#> + 1e+300 + 6e_1 + 7e_12 + 8e_123 + 9e_345

const(X) # should be 1e300
#> [1] 1e+300

const(X) <- 0.6
const(X) # should be 0.6, no numerical error
#> [1] 0.6

# compare naive approach:

X <- clifford(list(1,1:2,1:3,3:5), 6:9) + 1e300
X + 0.6 - const(X)  # constant gets lost in the numerics
#> Element of a Clifford algebra, equal to
#> + 6e_1 + 7e_12 + 8e_123 + 9e_345

X <- clifford(list(1,1:2,1:3,3:5), 6:9) + 1e-300
X - const(X) + 0.6  # answer correct by virtue of left-associativity
#> Element of a Clifford algebra, equal to
#> + 0.6 + 6e_1 + 7e_12 + 8e_123 + 9e_345


x <- 2+rcliff(d=3, g=3)
jj <- x*cliffconj(x)
is.real(jj*rev(jj))   # should be TRUE
#> [1] TRUE
```
