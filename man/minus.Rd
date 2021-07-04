\name{minus}
\alias{minus}
\alias{is.minus}
\title{Take the negative of a vector}
\description{

Very simple function that takes the negative of a vector, here so that
idiom such as

\code{coeffs(z)[gradesminus(z)\%\%2 != 0] \%<>\% minus}

works as intended (this taken from \code{Conj.clifford()}).

}

\usage{minus(x)}
\value{Returns a vector or disord}
\arguments{\item{x}{Any vector or disord object}
}
\author{Robin K. S. Hankin}
