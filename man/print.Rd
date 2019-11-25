\name{print}
\alias{print.clifford}
\title{Print clifford objects}
\description{Print methods for Clifford algebra}
\usage{
\method{print}{clifford}(x,...)
}
\arguments{
  \item{x}{Object of class \code{clifford} in the print method}
  \item{...}{Further arguments, currently ignored}
}
\author{Robin K. S. Hankin}
\note{

The print method does not change the internal representation of a
\code{clifford} object, which is a two-element list, the first of which
is a list of integer vectors representing blades, and the second is a
numeric vector of coefficients.

The print method has special dispensation for length-zero clifford objects
but these are not handled entirely consistently.

The print method is sensitive to the value of
\code{getOption("usecaret")}, defaulting to \dQuote{no}.  The default is
to use uppercase letters to represent multiplicative inverses, but if
\code{TRUE}, use \code{a^-1}.

}
\seealso{\code{\link{clifford}}}  
\examples{

rfalg()

}
