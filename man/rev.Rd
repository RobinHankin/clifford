\name{rev.clifford}
\alias{rev.clifford}
\alias{rev}
\title{Reverse of a Clifford object}
\description{
The \dQuote{reverse} of a blade is simply the basis vectors written in
reverse order; this changes the sign of the blade if the number of basis
vectors is 2 or 3 (modulo 4).  Taking the reverse is a linear operation.
}
\usage{
\method{rev}{clifford}(x)
}
\arguments{\item{x}{Clifford object}}
\author{Robin K. S. Hankin}
\examples{

x <- rcliff()
rev(x)
}