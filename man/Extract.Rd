\name{Extract.clifford}
\alias{[.clifford}
\alias{extract.clifford}
\alias{extract}
\alias{replace.clifford}
\alias{replace}
\alias{[<-.clifford}
\title{Extract or Replace Parts of a clifford}
\description{
  Extract or replace subsets of cliffords.
}
\usage{
\method{[}{clifford}(C, index, \dots)
\method{[}{clifford}(C, index, \dots) <- value
 }
\arguments{
  \item{C}{A clifford object}
  \item{index}{elements to extract or replace}
  \item{value}{replacement value}
  \item{...}{Further arguments}
}
\details{

Experimental extraction and replacement methods.  The extraction method
uses \code{getcoeffs()} and the replacement method uses low-level helper
function \code{c_overwrite()}.

In the extraction function \code{a[index]}, if \code{index} is a list,
further arguments are ignored.  If not, the dots are used.

Replacement methods using list-valued \code{index}, as in \code{A[i] <-
value} uses an ugly hack if \code{value} is zero.

Idiom such as \code{a[] <- b} follows the \code{spray} package.  If
\code{b} is a length-one scalar, then \code{coeffs(a) <- b} has the same
effect as \code{a[] <- b}.


  
}
\seealso{\code{\link{Ops.clifford}},\code{\link{clifford}}}
\examples{
A <- clifford(list(1,1:2,1:3),1:3)
B <- clifford(list(1:2,1:6),c(44,45))

A[1,c(1,3,4)]

A[2:3, 4] <- 99
A[] <- B

}


