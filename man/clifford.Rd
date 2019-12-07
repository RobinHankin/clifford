\name{clifford}
\alias{clifford}
\alias{as.clifford}
\alias{is.clifford}
\alias{blades}
\alias{coeffs}
\alias{coeffs<-}
\alias{coeffs<-.clifford}
\alias{nbits}
\alias{nterms}
\alias{is.blade}
\alias{is.1vector}
\alias{is_ok_clifford}
\title{Create, coerce, and test for \code{clifford} objects}
\description{

A clifford object is a member of a Clifford Algebra.  These objects may
be added and multiplied, and have various applications in physics and
mathematics
}

\usage{
clifford(blades, coeffs)
is_ok_clifford(blades, coeffs)
as.clifford(x)
is.clifford(x)
blades(x)
is.blade(x)
is.1vector(x)
coeffs(x)
coeffs(x) <- value
nbits(x)
nterms(x)
}
\arguments{
  \item{blades}{A list of integer vectors with strictly increasing
    entries corresponding to the basis vectors of the underlying vector
    space}
  \item{value,coeffs}{Numeric vector of coefficients}
  \item{x}{Object of class \code{clifford}}
}
\details{

  \itemize{
    
    \item Function \code{clifford()} is the formal creation mechanism
    for \code{clifford} objects

    \item Function \code{as.clifford()} is much more user-friendly and
    attempts to coerce a range of input arguments to clifford form

    \item Functions \code{blades()} and \code{coeffs()} are the
    extraction methods.  These are unordered vectors but the ordering is
    consistent between them (an extended discussion of this phenomenon
    is presented in the \code{mvp} package).

    \item Function \code{coeffs<-()} (idiom \code{coeffs(a) <- b}) sets
    all coefficients of \code{a} to \code{b}.  This has the same effect
    as \code{a[] <- b}.

    \item Function \code{nbits()} returns the number of bits required in
    the low-level C routines to store the blades (this is the largest
    entry in the list of blades)

    \item Function \code{nterms()} returns the number of terms in the
    expression
    
    \item Function \code{is_ok_clifford()} is a helper function that checks
    for consistency of its arguments

    \item Function \code{is.blade()} returns \code{TRUE} if its argument
    is a single blade or a nonzero scalar; the zero clifford object is
    not considered to be a blade.

    \item Function \code{is.1vector()} returns \code{TRUE} if every
    blade is of grade 1.

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

blades(x+100)
coeffs(z)

(x*y)*z == x*(y*z)  # should be true
x*(y+z) == x*y + x*z  # should be true

coeffs(z) <- 1999

}
