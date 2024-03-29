\name{drop}
\alias{drop}
\alias{drop_clifford}
\alias{drop,clifford-method}
\title{Drop redundant information}
\description{Coerce scalar Clifford objects to numeric}
\usage{
drop(x)
drop_clifford(x)
}
\arguments{\item{x}{Clifford object}}
\details{

  If its argument is a pure scalar clifford object, or the pseudoscalar,
  coerce to numeric.  Scalar or pseudoscalar clifford objects are
  coerced to an \emph{unnamed} numeric vector (of length 1).  Checking
  for being the pseudoscalar requires that option \code{maxdim} be set.

  Function \code{drop()} is generic, dispatching to helper function
  \code{drop_clifford()} for clifford objects.  The logic of
  \code{drop_clifford()} prevents \code{is.pseudoscalar()} being called
  if \code{maxdim} is \code{NULL}.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{const}},\code{\link{pseudoscalar}}}
\note{Many functions in the package take \code{drop} as an argument
  which, if \code{TRUE}, means that the function returns a
  \code{drop}ped value.}
\examples{
drop(as.clifford(5))

const(rcliff())
const(rcliff(),drop=FALSE)

}
