\name{pseudoscalar}
\alias{pseudoscalar}
\alias{as.pseudoscalar}
\alias{is.pseudoscalar}
\title{Coercion from numeric to Clifford form}
\description{
Given a numeric value or vector, return a Clifford algebra element}
\usage{
pseudoscalar(n=getOption("maxdim"))
as.pseudoscalar(n)
is.pseudoscalar(C)
}
\arguments{
  \item{n}{Integer specifying dimensionality of underlying vector space} 
  \item{C}{Object possibly of class Clifford}
}
\details{

  Function \code{pseudoscalar(n)} returns the unit pseudoscalar of
  dimensionality \code{n} and function \code{is.pseudoscalar()} checks
  for a Clifford object being a pseudoscalar.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{getcoeffs}},\code{\link{numeric_to_clifford}},\code{\link{const}}}
\examples{

pseudoscalar(6)


}

