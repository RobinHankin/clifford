\name{zero}
\alias{zero}
\alias{is.zero}
\title{The zero Clifford object}
\description{

Dealing with the zero Clifford object presents particular challenges.
Some of the methods need special dispensation for the zero object.

}

\usage{
is.zero(C)
}
\arguments{
  \item{C}{Clifford object}
}
\details{

To create the zero object \emph{ab initio}, use

\code{clifford(list(),numeric(0))}

although note that \code{scalar(0)} will work too.

}
\author{Robin K. S. Hankin}
\note{
  The coefficient of the zero clifford object, as in
  \code{coeff(scalar(0))}, is \code{numeric(0)} (but note that \code{1 +
    NULL} also returns \code{numeric(0)}).
}
\seealso{\code{\link{scalar}}}
\examples{

is.zero(rcliff())
}
