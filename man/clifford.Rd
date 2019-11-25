\name{clifford}
\alias{clifford}
\alias{as.clifford}
\alias{is.clifford}
\title{Create, coerce, and test for \code{clifford} objects}
\description{

A clifford object is a member of a Clifford Algebra.  These objects may
be added and multiplied, and have various applications in physics and
mathematics
}

\usage{
clifford(blades, coeffs)
as.clifford(x)
is.clifford(x)
}
\arguments{
  \item{blades}{A list of integer vectors with strictly increasing
    entries corresponding to the basis vectors of the underlying vector
    space}
  \item{coeffs}{Numeric vector of coefficients}
}
\details{
Function \code{clifford()} is the formal creation mechanism for
\code{clifford} objects.

Function \code{as.clifford()} is much more user-friendly and attempts to
coerce a range of input arguments to clifford form.
}
\references{
Snygg 2012.  \dQuote{A new approach to differential geometry using
  Clifford's geometric algebra}.  Birkh\"{a}user; Springer
Science+Business.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{clifford.ops}}}
\examples{

rcliff(7,6)
}
