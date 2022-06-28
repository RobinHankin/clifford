\name{clifford}
\alias{clifford}
\alias{clifford-class}
\alias{as.clifford}
\alias{is.clifford}
\alias{nbits}
\alias{nterms}
\alias{dim}
\alias{dim.clifford}
\alias{dimension}
\alias{is_ok_clifford}
\title{Create, coerce, and test for \code{clifford} objects}
\description{

An object of class \code{clifford} is a member of a Clifford algebra.
These objects may be added and multiplied, and have various applications
in physics and mathematics.}

\usage{
clifford(terms, coeffs=1)
is_ok_clifford(terms, coeffs)
as.clifford(x)
is.clifford(x)
nbits(x)
nterms(x)
\method{dim}{clifford}(x)
}
\arguments{
  \item{terms}{A list of integer vectors with strictly increasing
    entries corresponding to the basis vectors of the underlying vector
    space}
  \item{coeffs}{Numeric vector of coefficients}
  \item{x}{Object of class \code{clifford}}
}
\details{

  \itemize{
    
    \item Function \code{clifford()} is the formal creation mechanism
    for \code{clifford} objects

    \item Function \code{as.clifford()} is much more user-friendly and
    attempts to coerce a range of input arguments to clifford form

    \item Function \code{nbits()} returns the number of bits required in
    the low-level C routines to store the terms (this is the largest
    entry in the list of terms).  For a scalar, this is zero and for the
    zero clifford object it (currently) returns zero as well although
    a case could be made for \code{NULL}

    \item Function \code{nterms()} returns the number of terms in the
    expression
    
    \item Function \code{is_ok_clifford()} is a helper function that checks
    for consistency of its arguments

    \item Function \code{is.term()} returns \code{TRUE} if all terms of
    its argument have the same grade
  }
}
\references{
Snygg 2012.  \dQuote{A new approach to differential geometry using
  Clifford's geometric algebra}.  Birkhauser; Springer
Science+Business.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{Ops.clifford}}}
\examples{

(x <- clifford(list(1,2,1:4),1:3))   # Formal creation method
(y <- as.1vector(4:2))
(z <- rcliff(include.fewer=TRUE))

terms(x+100)
coeffs(z)

## Clifford objects may be added and multiplied:

x + y
x*y

}
