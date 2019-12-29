\name{antivector}
\alias{antivector}
\alias{is.antivector}
\title{Antivectors or pseudovectors}
\description{
Antivectors or pseudovectors
}
\usage{
antivector(v, n = length(v))
is.antivector(C)
}
\arguments{
  \item{v}{Numeric vector}
  \item{n}{Integer}
  \item{C}{Clifford object}
}
\details{
An \dfn{antivector} is an \eqn{n}-dimensional Clifford object of all of
whose terms are of grade \eqn{n-1}.
}
\references{
Wikipedia page
}
\author{Robin K. S. Hankin}
\examples{
antivector(1:5)
}