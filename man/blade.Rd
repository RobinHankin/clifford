\name{blade}
\alias{blade}
\alias{blade}
\alias{blades}
\alias{is.blade}
\alias{is.basisblade}
\title{Deal with blades}
\description{

From Perwass: a \dfn{blade} is the outer product of a number of
1-vectors.


}

\usage{
blades(x)
blade(B)
is.blade(x)
is.basisblade(x)
}
\arguments{
  \item{x}{Object of class \code{clifford}}
  \item{B}{Integer vector specifying a blade}
}
\details{

  \itemize{
    
    \item Functions \code{blades()} and \code{coeffs()} are the
    extraction methods.  These are unordered vectors but the ordering is
    consistent between them (an extended discussion of this phenomenon
    is presented in the \code{mvp} package).

    \item Function \code{blade()} returns clifford object that comprises
    a single blade with unit coefficient.
    
    \item Function \code{is.blade()} returns \code{TRUE} if all terms of
    its argument have the same grade.

    \item Function \code{is.basisblade()} returns \code{TRUE} if its
    argument has only a single term, or is a nonzero scalar; the zero
    clifford object is not considered to be a basis blade.

  }
}
\references{
  C. Perwass. \dQuote{Geometric algebra with applications in
  engineering}.   Springer, 2009.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{clifford}}}
\examples{

x <- rcliff()
blades(x)

is.basisblade(x)

}
