\name{pseudoscalar}
\alias{pseudoscalar}
\alias{as.pseudoscalar}
\alias{is.pseudoscalar}
\title{Coercion from numeric to Clifford form}
\description{
Given a numeric value or vector, return a Clifford algebra element}
\usage{
pseudoscalar()
is.pseudoscalar(C)
}
\arguments{
  \item{C}{Object possibly of class Clifford}
}
\details{

  Function \code{pseudoscalar()} returns the unit pseudoscalar of
  dimensionality \code{option("maxdim")} and function
  \code{is.pseudoscalar()} checks for a Clifford object being a
  pseudoscalar.  Note that these functions \emph{require} \code{maxdim}
  to be set; otherwise they are meaningless.

  Usually, one will set \code{option(maxdim)} at the start of a session,
  together with the signature.  Then one might define \code{I <-
  pseudoscalar()} in the interests of compactness and legibility.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{getcoeffs}},\code{\link{numeric_to_clifford}},\code{\link{const}}}
\examples{

options(maxdim=6)
I <- pseudoscalar()
is.pseudoscalar(I)
options(maxdim=NULL) # restore default
}

