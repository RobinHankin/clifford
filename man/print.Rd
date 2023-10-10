\name{print}
\alias{print.clifford}
\alias{as.character}
\alias{as.character.clifford}
\alias{catterm}
\alias{basissep}
\title{Print clifford objects}
\description{Print methods for Clifford algebra}
\usage{
\method{print}{clifford}(x,...)
\method{as.character}{clifford}(x,...)
catterm(a)
}
\arguments{
  \item{x}{Object of class \code{clifford} in the print method}
  \item{...}{Further arguments, currently ignored}
  \item{a}{Integer vector representing a term}
}
\author{Robin K. S. Hankin}
\note{

The print method does not change the internal representation of a
\code{clifford} object, which is a two-element list, the first of which
is a list of integer vectors representing terms, and the second is a
numeric vector of coefficients.

The print method is sensitive to the value of option \code{separate}.
If \code{FALSE} (the default), the method prints in a compact form, as
in \code{e_134}.  The indices of the basis vectors are separated with
option \code{basissep} which is usually \code{NULL} but if \eqn{n>9},
then setting \code{options("basissep" = ",")} might look good as it will
print \code{e_10,11,12} instead of \code{e_101112}.  If \code{separate}
is \code{TRUE}, the method prints the basis vectors separately, as in
\code{e1 e3 e4}.

Function \code{as.character.clifford()} is also sensitive to these
options.  The print method has special dispensation for length-zero
clifford objects.  Function \code{catterm()} is a low-level helper
function.

}
\seealso{\code{\link{clifford}}}  
\examples{

options(maxdim=15)
a <- rcliff(d=15,g=9)
a   # incomprehensible

options("separate" = TRUE)
a    # marginally better


options("separate" = FALSE)
options(basissep=",")
a    #  clearer; YMMV

options(basissep = NULL, maxdim=NULL)  # restore default

}
