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

  To test for a Clifford object's being zero, use \code{is.zero()}.
  Idiom such as \code{x==0} will work irregardless, but sometimes one
  might prefer the functional form for stylistic reasons.

  To create the zero object \emph{ab initio}, use

  \code{clifford(list(),numeric(0))}

  although note that \code{scalar(0)} will work too.

}
\author{Robin K. S. Hankin}
\note{
  The coefficient of the zero clifford object, as in
  \code{coeff(scalar(0))}, is \code{numeric(0)} (but note that \code{1 +
    NULL} also returns \code{numeric(0)}).

Function \code{is.zero()} is problematic if another package which also
  has an \code{is.zero()} generic is loaded, for this will mask
  \code{clifford::is.zero()}.  Specifically, the \CRANpkg{jordan}
  package includes \code{jordan::is.zero()} and the two do not play
  nicely together.

}
\seealso{\code{\link{scalar}}}
\examples{

is.zero(rcliff())
}
