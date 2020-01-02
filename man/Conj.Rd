\name{Conj}
\alias{Conj.clifford}
\alias{Conj}
\title{Conjugate of a Clifford object}
\description{The \dQuote{conjugate} of a Clifford object is defined by
  Perwass in definition 2.9, p59.}
\usage{\method{Conj}{clifford}(z)}
\arguments{\item{z}{Clifford object}}
\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}},\code{\link{rev}}}
\references{C. Perwass 2009. \dQuote{Geometric algebra with applications
    in engineering}.  Springer.
}
\examples{

signature(2)
x <- rcliff()
Conj(x)


x*Conj(x)

signature(0)

}