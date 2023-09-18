\name{zero}
\alias{zero}
\alias{is.zero}
\alias{is.zero,clifford-method}
\alias{is.zero,ANY-method}
\alias{is.zero.clifford}
\title{The zero Clifford object}
\description{
  Dealing with the zero Clifford object presents particular challenges.
  Some of the methods need special dispensation for the zero object.
}
\usage{
is.zero(x)
}
\arguments{
  \item{x}{Clifford object}
}
\details{

  To test for a Clifford object's being zero, use \proglang{S4} generic
  \code{is.zero()}.  Idiom such as \code{x==0} will also work but often
  one prefers the functional form.

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
