\name{numeric_to_clifford}
\alias{numeric_to_clifford}
\alias{as.cliffvector}
\alias{as.scalar}
\title{Coercion from numeric to Clifford form}
\description{
Given a numeric value or vector, return a Clifford algebra element}
\usage{
numeric_to_clifford(x)
as.cliffvector(x)
as.scalar(x)
}
\arguments{\item{x}{Numeric vector}}
\details{

  Function \code{as.scalar()} takes a length-one numeric vector and
  returns a Clifford scalar of that value.

  Function \code{as.cliffvector()} takes a numeric vector and returns
  the linear sum of length-one blades with coefficients given by
  \code{x}.

  Function \code{numeric_to_vector()} dispatches to either
  \code{as.scalar()} for length-one vectors or \code{as.cliffvector()}
  if the length is greater than one.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{clifford}}}
\examples{


as.scalar(6)
as.cliffvector(1:8)
}

