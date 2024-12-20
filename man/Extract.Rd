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
\method{[}{clifford}(C, index, \dots,drop=FALSE)
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
  \item{drop}{Boolean: should constant clifford objects
      be coerced to numeric?}
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
length-one numeric vector; (replacement vectors of length greater than
one are currently not implemented, whether or not they violate
\code{disordR} discipline).  Otherwise, to manipulate parts of a
clifford object, use \code{coeffs(a) <- value}; \code{disord}
discipline is enforced.  Idiom such as \code{a[coeffs(a)<2] <- 0} is
implemented experimentally, as syntactic sugar for
\code{coeffs(a)[coeffs(a)<2] <- 0}.  Replacement using a list-valued
index, as in \code{A[i] <- value} uses an ugly hack if \code{value} is
zero.  Replacement methods are not yet finalised and not yet fully
integrated with the \code{disordR} package.

Idiom such as \code{a[] <- b} follows the \code{spray} package.  If
\code{b} is a length-one scalar, then \code{coeffs(a) <- b} has the same
effect as \code{a[] <- b}.

Grade-based replacement methods such as \code{grade(C,n) <- value} are
impemented and documented at \code{grade.Rd}.
    
Functions \code{terms()} [see \code{term.Rd}] and \code{coeffs()}
extract the terms and coefficients from a clifford object.  These
functions return \code{disord} objects but the ordering is consistent
between them (an extended discussion of this phenomenon is presented
in the \CRANpkg{mvp} package).  Note that \code{coeffs()} returns
\code{numeric(0)} on the zero clifford object.

Function \code{coeffs<-()} (idiom \code{coeffs(a) <- b}) sets all
coefficients of \code{a} to \code{b}.  This has the same effect as
\code{a[] <- b}.

Extracting or replacing a list with a repeated elements is usually a Bad
Idea (tm).  However, if option \code{warn_on_repeats} is set to
\code{FALSE}, no warning will be given (and the coefficient will be the
sum of the coefficients of the term; see the examples).

Function \code{getcoeffs()} is a lower-level helper function that
lacks the succour offered by \code{[.clifford()}.  It returns a named
numeric vector [not a \code{disord} object: the order of the elements
is determined by the order of argument \code{B}].  Compare standard
extraction, eg \code{a[index]}, which returns a clifford object.  The
names of the returned vector are determined by function
\code{catterm()}.

Attempting to extract a coefficient of a term that includes a negative
index will throw an error.  The coefficient of a term not present in
the Clifford object (including term with an index larger than
indicated by \code{maxyterm()}) will return zero.

The index for the constant is formally \code{list(numeric(0))}, but
this is a pain to type.  Square bracket extraction and
\code{getcoeffs()} have special dispensation for zero entries, which
are translated by helper function \code{list_modifier()} to
\code{numeric(0)} and listified if necessary.  The upshot is that
\code{x[0]} and \code{getcoeffs(x,0)} work as expected, returning the
constant.

Function \code{Im()} is a generic, which sets the real component of its
argument to zero (as per the \CRANpkg{onion} package).  Function
\code{Re()} is a convenience synonym for \code{const()}.

Vignette \code{getcoeffs} gives a more extended discussion of function
\code{getcoeffs()}.

}
\seealso{
    \code{\link{Ops.clifford}},
    \code{\link{clifford}},
    \code{\link{term}}
    \code{\link{grade}}
}
\examples{
A <- clifford(list(1,1:2,1:3),1:3)
B <- clifford(list(1:2,1:6),c(44,45))

A[1,c(1,3,4)]

A[2:3, 4] <- 99
A[] <- B



X <- 5 + 6*e(1) -7*e(1:3) + 3*e(4:5)
X[0]           # special dispensation for zero
X[0,drop=TRUE] # coerce to numeric
X[list(0,1:3)] 

getcoeffs(X,0)
getcoeffs(X,list(1,0,1:3))

# clifford(list(1,1:2,1:2),1:3)  # would give a warning

options("warn_on_repeats" = FALSE)
clifford(list(1,1:2,1:2),1:3)  # works; 1e1 + 5e_12

options("warn_on_repeats" = TRUE) # return to default behaviour.


}


