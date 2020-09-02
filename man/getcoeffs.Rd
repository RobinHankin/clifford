\name{getcoeffs}
\alias{getcoeffs}
\title{Get coefficients of a Clifford object}
\description{
Access specific coefficients of a Clifford object using a list of terms.
}
\usage{
getcoeffs(C, B)
}
\arguments{
  \item{C}{Clifford object}
  \item{B}{List of terms}
}
\details{

Extractor method for specific terms.  Returns a vector of coefficients
in the  same order as the list of terms.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{clifford}},\code{\link{const}}}
\examples{

X <- clifford(list(1,1:2,1:3,3:5),6:9)

getcoeffs(X,1:2)

}
