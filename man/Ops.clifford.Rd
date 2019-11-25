\name{Ops.clifford}
\alias{\%.\%}
\alias{\%^\%}
\alias{\%.\%.clifford}
\alias{\%^\%.clifford}
\alias{Ops.clifford}
\alias{Ops}
\alias{c_identity}
\alias{c_add}
\alias{c_multiply}
\alias{c_power}
\alias{c_equal}
\alias{clifford_negative}
\alias{clifford_times_clifford}
\alias{clifford_times_scalar}
\alias{clifford_plus_clifford}
\alias{clifford_plus_numeric}
\alias{clifford_plus_scalar}
\alias{clifford_power_scalar}
\alias{clifford_eq_clifford}
\title{Arithmetic Ops Group Methods for \code{clifford} objects}
\description{
  Allows arithmetic operators to be used for
  multivariate polynomials  such as addition, multiplication,
  integer powers, etc.
}
\usage{
\method{Ops}{clifford}(e1, e2)
c_identity(L, p, m)
c_add(L1, c1, L2, c2, m)
c_multiply(L1, c1, L2, c2, m, sig)
c_power(L, c, m, p, sig)
c_equal(L1, c1, L2, c2, m)
clifford_negative(C)
clifford_times_clifford(C1,C2)
clifford_times_scalar(C,x)
clifford_plus_clifford(C1,C2)
clifford_eq_clifford(C1,C2)
C1 \%.\% C2
C1 \%^\% C2
}
\arguments{
  \item{e1,e2,C,C1,C2}{Objects of class \code{clifford}}
  \item{x}{Scalar, length one numeric vector}
  \item{L,L1,L2}{Lists of blades}
  \item{c1,c2,c}{Numeric vectors of coefficients}
  \item{m}{Maximum entry of blades}
  \item{p}{Integer power}
  \item{sig}{Positive integer representing number of \eqn{+1} on main
    diagonal of quadratic form}
}
\details{

  The function \code{Ops.clifford()} passes unary and binary arithmetic
  operators \dQuote{\code{+}}, \dQuote{\code{-}}, \dQuote{\code{*}} and
  \dQuote{\code{^}} to the appropriate specialist function.

  Idiom \code{x \%.\% y} returns the inner product \code{(xy+yx)/2} and
  \code{x \%^\% y} returns the wedge product \code{(xy-yx)/2}.
  
  Functions \code{c_foo()} are low-level helper functions that wrap the
  \code{C} code.

}
\value{

  The high-level functions documented here return an object of
  \code{clifford}.  But don't use the low-level functions.

}
\author{Robin K. S. Hankin}
\examples{

x1 <- rcliff(5)
x2 <- rcliff(5)
x3 <- rcliff(5)

x1*x2

x1^3


x1+(x2+x3) == (x1+x2)+x3
x1 \%^\% x2 == (x1*x2-x2*x1)/2  

}

