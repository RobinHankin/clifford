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

The print method has special dispensation for length-zero clifford
objects.  It is sensitive to the value of \code{options("separate")}
which, if \code{TRUE} prints the basis vectors separately and otherwise
prints in a compact form.  The indices of the basis vectors are
separated with \code{option("basissep")} which is usually \code{NULL}
but if \eqn{n>9}, then setting \code{options("basissep" = ",")} might
look good.

}
\seealso{\code{\link{clifford}}}  
\examples{

rcliff()   # fine
rcliff(d=15) # incomprehensible


options("separate" = TRUE)
rcliff(d=15) # incomprehensible


options("separate" = FALSE)


}
