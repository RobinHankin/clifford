\name{clifford}
\alias{clifford}
\alias{as.clifford}
\alias{is.clifford}
\alias{blades}
\alias{coeffs}
\alias{is.scalar}
\alias{is.zero}
\alias{nbits}
\alias{nterms}
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
coeffs(x)
is.scalar(x)
is.zero(x)
nbits(x)
nterms(x)

}
\arguments{
  \item{blades}{A list of integer vectors with strictly increasing
    entries corresponding to the basis vectors of the underlying vector
    space}
  \item{coeffs}{Numeric vector of coefficients}
  \item{x}{Object of class \code{clifford}}
}
\details{

  \itemize{
    
    \item Function \code{clifford()} is the formal creation mechanism for
\code{clifford} objects

\item Function \code{as.clifford()} is much more user-friendly and
attempts to coerce a range of input arguments to clifford form

\item Functions \code{blades()} and \code{coeffs()} are the extraction
methods.  These are unordered vectors but the ordering is consistent
between them (an extended discussion of this phenomenon is presented in
the \code{mvp} package)

\item Functions \code{is.scalar()} and \code{is.zero()} check for a
clifford object being a scalar (one empty blade), or the zero object
(zero blades) respectively

\item Function \code{nbits()} returns the number of bits required in the
low-level C routines to store the blades (this is the largest entry in
the list of blades)

\item Function \code{nterms()} returns the number of terms in the
expression
\item Function \code{is_ok_clifford()} is a helper function that checks
for consistency of its arguments}
}
\references{
Snygg 2012.  \dQuote{A new approach to differential geometry using
  Clifford's geometric algebra}.  Birkh\"{a}user; Springer
Science+Business.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{Ops.clifford}}}
\examples{

rcliff(7,6)
}
