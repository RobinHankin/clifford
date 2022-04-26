\name{antivector}
\alias{antivector}
\alias{as.antivector}
\alias{is.antivector}
\title{Antivectors or pseudovectors}
\description{\loadmathjax
Antivectors or pseudovectors
}
\usage{
antivector(v, n = length(v))
as.antivector(v)
is.antivector(C, include.pseudoscalar=FALSE)
}
\arguments{
  \item{v}{Numeric vector}
  \item{n}{Integer specifying dimensionality of underlying vector space}
  \item{C}{Clifford object}
  \item{include.pseudoscalar}{Boolean: should the pseudoscalar be
    considered an antivector?}
}
\details{

An \dfn{antivector} is an \mjseqn{n}-dimensional Clifford object, all of
whose terms are of grade \mjseqn{n-1}.  An antivector has \mjseqn{n}
degrees of freedom.  Function \code{antivector(v,n)} interprets
\code{v[i]} as the coefficient of \mjeqn{e_1e_2\ldots
e_{i-1}e_{i+1}\ldots e_n}{omitted}.

Function \code{as.antivector()} is a convenience wrapper, coercing its
argument to an antivector of minimal dimension (zero entries are
interpreted consistently).

The pseudoscalar is a peculiar edge case.  Consider:

\preformatted{
  A <- clifford(list(c(1,2,3)))
  B <- A + clifford(list(c(1,2,4)))

> is.antivector(A)
[1] FALSE
> is.antivector(B)
[1] TRUE
> is.antivector(A,include.pseudoscalar=TRUE)
[1] TRUE
> is.antivector(B,include.pseudoscalar=TRUE)
[1] TRUE
}

One could argue that \code{A} should be an antivector as it is a term in
\code{B}, which is definitely an antivector.  Use
\code{include.pseudoscalar=TRUE} to ensure consistency in this case.

Compare \code{as.1vector()}, which returns a clifford object of grade 1.

}

\note{An antivector is always a blade.}
\references{

  Wikipedia contributors. (2018, July 20). \dQuote{Antivector}.  In
  \emph{Wikipedia, The Free Encyclopedia}. Retrieved 19:06, January 27,
  2020, from
  \url{https://en.wikipedia.org/w/index.php?title=Antivector&oldid=851094060}

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{as.1vector}}}
\examples{
antivector(1:5)

as.1vector(c(1,1,2)) \%X\% as.1vector(c(3,2,2))
c(1*2-2*2, 2*3-1*2, 1*2-1*3)  # note sign of e_13

}