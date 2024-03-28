\name{print}
\alias{print.clifford}
\alias{print.cliff}
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
numeric vector of coefficients.  The print method has special
dispensation for the zero clifford object.

The print method is sensitive to the value of options \code{separate}
and \code{basissep}.  If option \code{separate} is \code{FALSE} (the
default), the method prints the basis blades in a compact form, as in
\dQuote{\code{e_134}}.  The indices of the basis vectors are separated
with the value of option \code{basissep} which is usually \code{NULL};
but if \eqn{n>9}, then setting option \code{basissep} to a comma
(\dQuote{\code{,}}) might look good as it will print \code{e_10,11,12}
instead of \code{e_101112}:

\preformatted{options("basissep" = ",")}

If option \code{separate} is \code{TRUE}, the method prints the basis
vectors separately, as in \code{e10 e11 e12}:

\preformatted{options("separate" = TRUE)}

Function \code{catterm()} is a low-level helper function, used in the
print method, coercion to character, and also in function
\code{getcoeffs()} to set the names of its output.  It takes an integer
vector like \code{c(1,5,6)} and returns a representation of the
corresponding basis blade, in this case \dQuote{\code{e_156}}.  Function
\code{catterm()} is where options \code{basissep} and \code{separate}
are processed.  Special dispensation is needed for length-zero vectors,
for which the empty string is returned.  This is needed to ensure that
the constant term (which has a basis blade of \code{numeric(0)}) is
treated appropriately.  See also \code{list_modifier()} which deals with
this issue.

}
\seealso{\code{\link{clifford}}}  
\examples{

a <- rclifff(9)
a   # default print method incomprehensible

options("separate" = TRUE)
a    # marginally better


options("separate" = FALSE)
options(basissep=",")
a    #  clearer; YMMV

options(basissep = NULL, maxdim=NULL)  # restore default

}
