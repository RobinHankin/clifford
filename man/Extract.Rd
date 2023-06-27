\name{Extract.clifford}
\alias{[.clifford}
\alias{extract.clifford}
\alias{warn_on_repeats}
\alias{extract}
\alias{replace.clifford}
\alias{replace}
\alias{[<-.clifford}
\alias{coeffs}
\alias{list_modifier}
\alias{coeffs<-}
\alias{coeffs<-.clifford}
\alias{getcoeffs}
\alias{Re}
\alias{Im}
\alias{Re.clifford}
\alias{Im.clifford}
\title{Extract or Replace Parts of a clifford}
\description{
  Extract or replace subsets of cliffords.
}
\usage{
\method{[}{clifford}(C, index, \dots)
\method{[}{clifford}(C, index, \dots) <- value
coeffs(x)
coeffs(x) <- value
list_modifier(B)
getcoeffs(C, B)
\method{Im}{clifford}(z)
\method{Re}{clifford}(z)
}
\arguments{
  \item{C,x,z}{A clifford object}
  \item{index}{elements to extract or replace}
  \item{value}{replacement value}
  \item{B}{A list of integer vectors, terms}
  \item{...}{Further arguments}
}
\details{

Extraction and replacement methods.  The extraction method uses
\code{getcoeffs()} and the replacement method uses low-level helper
function \code{c_overwrite()}.

In the extraction function \code{a[index]}, if \code{index} is a list,
further arguments are ignored; if not, the dots are used.  If
\code{index} is a list, its elements are interpreted as integer vectors
indicating which terms to be extracted (even if it is a \code{disord}
object).  If \code{index} is a \code{disord} object, standard
consistency rules are applied.  The extraction methods are designed so
that idiom such as \code{a[coeffs(a)>3]} works.

For replacement methods, the standard use-case is \code{a[i] <- b} in
which argument \code{i} is a list of integer vectors and \code{b} a
length-one numeric vector.  Otherwise, to manipulate parts of a clifford
object, use \code{coeffs(a) <- value}; this effectively leverages
\code{disord} formalism.  Idiom such as \code{a[coeffs(a)<2] <- 0} is
not currently implemented (to do this, use \code{coeffs(a)[coeffs(a)<2]
<- 0}).  Replacement using a list-valued index, as in \code{A[i] <-
value} uses an ugly hack if \code{value} is zero.  Replacement methods
are not yet finalised and not yet fully integrated with the
\code{disordR} package.

Idiom such as \code{a[] <- b} follows the \code{spray} package.  If
\code{b} is a length-one scalar, then \code{coeffs(a) <- b} has the same
effect as \code{a[] <- b}.

Functions \code{terms()} [see \code{term.Rd}] and \code{coeffs()}
extract the terms and coefficients from a clifford object.  These
functions return \code{disord} objects but the ordering is consistent
between them (an extended discussion of this phenomenon is presented in
the \code{mvp} package).

Function \code{coeffs<-()} (idiom \code{coeffs(a) <- b}) sets all
coefficients of \code{a} to \code{b}.  This has the same effect as
\code{a[] <- b}.

Extraction and replacement methods treat \code{0} specially, translating
it (via \code{list_modifier()}) to \code{numeric(0)}.

Extracting or replacing a list with a repeated elements is usually a Bad
Idea (tm).  However, if option \code{warn_on_repeats} is set to
\code{FALSE}, no warning will be given (and the coefficient will be the
sum of the coefficients of the term; see the examples).

Function \code{getcoeffs()} is a lower-level helper function that lacks
the succour offered by \code{[.clifford()}.  It returns a numeric vector
[not a \code{disord} object: the order of the elements is determined by
the order of argument \code{B}].  Compare standard extraction, eg
\code{a[index]}, which returns a clifford object.  Attempting to extract
a coefficient of a term that includes a negative index will throw an
error.  The coefficient of a term including an index larger than
indicated by \code{maxyterm()} will return zero.

Function \code{Im()} is a generic, which sets the real component of its
argument to zero (as per the \CRANpkg{onion} package).  Function
\code{Re()} is a convenience synonym for \code{const()}.

}
\seealso{\code{\link{Ops.clifford}},\code{\link{clifford}},\code{\link{term}}}
\examples{
A <- clifford(list(1,1:2,1:3),1:3)
B <- clifford(list(1:2,1:6),c(44,45))

A[1,c(1,3,4)]

A[2:3, 4] <- 99
A[] <- B


X <- 1 + e(1)
X[0,1:5] <- 7   # special dispensation for zero, via list_modifier()
X


# clifford(list(1,1:2,1:2),1:3)  # would give a warning

options("warn_on_repeats" = FALSE)
clifford(list(1,1:2,1:2),1:3)  # works; 1e1 + 5e_12

options("warn_on_repeats" = TRUE) # return to default behaviour.


}


