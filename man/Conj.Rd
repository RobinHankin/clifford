\name{Conj}
\alias{Conj.clifford}
\alias{Conj}
\title{Conjugate of a Clifford object}
\description{The \dQuote{conjugate} of a Clifford object }
\usage{\method{Conj}{clifford}(z)}
\arguments{\item{z}{Clifford object}}
\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}},\code{\link{rev}}}
\examples{

signature(2)
x <- rcliff()
Conj(x)


x*Conj(x)

signature(0)

}