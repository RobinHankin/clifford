\name{minus}
\alias{minus}
\alias{is.minus}
\title{Take the negative of a vector}
\description{Very simple function that takes the negative of a vector.}
\usage{minus(x)}
\arguments{\item{x}{Clifford object}}
\details{

  This trivial function is here so that idiom such as

\preformatted{coeffs(z)[gradesminus(z)\%\%2 != 0] \%<>\% minus}

works as intended (this taken from \code{Conj.clifford()}).  Most of the
functions in \code{R/involutions.R} use \code{minus()}.

}
\value{Returns a clifford object}
\author{Robin K. S. Hankin}
\seealso{\code{\link{involution}}}
\examples{

x <- rcliff()
minus(x)

}
