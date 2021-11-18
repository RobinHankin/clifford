\name{drop}
\alias{drop}
\alias{drop,clifford-method}
\title{Drop redundant information}
\description{Coerce constant Clifford objects to numeric}
\usage{drop(x)}
\arguments{\item{x}{Clifford object}}
\details{If its argument is a constant clifford object, coerce to numeric.}
\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}},\code{\link{getcoeffs}}}
\note{Many functions in the package take \code{drop} as an argument
  which, if \code{TRUE}, means that the function returns a
  \code{drop}ped value.}
\examples{
drop(as.clifford(5))

const(rcliff())
const(rcliff(),drop=FALSE)

}
