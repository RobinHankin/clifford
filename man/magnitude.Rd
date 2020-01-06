\name{magnitude}
\alias{magnitude}
\alias{mod}
\alias{Mod}
\alias{Mod.clifford}
\alias{scalprod}
\alias{scalar_product}
\alias{eucprod}
\alias{euclid\_product}
\alias{euclidean\_product}
\title{Scalar products of clifford objects}
\usage{
scalprod(C1,C2=rev(C1),drop=TRUE)
eucprod(C1,C2=Conj(C1),drop=TRUE)
\method{Mod}{clifford}(z)
}
\arguments{
  \item{C1,C2,z}{Clifford objects}
  \item{drop}{Boolean, with default \code{TRUE} meaning to return the
    constant coerced to numeric, and \code{FALSE} meaning to return a
    (constant) Clifford object}
}
\description{

  The \dfn{scalar product} of two clifford objects is defined as the
  zero-grade component of their geometric product:
  
  \deqn{
    A\ast B=\left<AB\right>_0\qquad{\mbox{NB: notation used by both Perwass
    and Hestenes}}
  }{
    omitted; see PDF
  }

  In package idiom the scalar product is given by \code{A \%star\% B} or
  \code{scalprod(A,B)}.

  \strong{Note: in the package, \code{A*B} is the geometric product}.
  
  The \dfn{Euclidean product} (or \dfn{Euclidean scalar product}) of two
  clifford objects is defined as 

  \deqn{
    A\star B=A\ast B^\dag=\left<AB^\dag\right>_0\qquad{\mbox{Perwass}}
  }{
    omitted: see PDF
  }

  where \eqn{B^\dag}{?} denotes Conjugate [as in \code{Conj(a)}].  In
  package idiom the Euclidean scalar product is given by
  \code{eucprod(A,B)} or \code{A \%euc\% B}, both of which return
  \code{A * Conj(B)}.

  Note that the scalar product \eqn{A\ast A} can be positive or negative
  [that is, \code{A \%star\% A} may be any sign], but the Euclidean
  product is guaranteed to be non-negative [that is, \code{A \%euc\% A}
  is always positive or zero].
  
  We define the \dfn{magnitude} \eqn{\left|\left|A\right|\right|}{||A||}
  of a clifford object \eqn{A} to be \eqn{\sqrt{A\star A}}{see PDF}; in
  package idiom it is given by \code{Mod(A)}, which is never negative.

 
}
\author{Robin K. S. Hankin}
\note{

Hestenes and Perwass both use an asterisk for scalar product as in
\eqn{A*B}, but in package idiom, the asterisk is reserved for geometric
product.

If you want the square, \eqn{\left|A\right|^2}{|A|^2} and not
\eqn{\left|A\right|}{|A|}, it is faster and more accurate to use
\code{scalprod(A)}, because \code{Mod(A)^2} takes a needless square
root).

There is a nice example of scalar product at \code{rcliff.Rd}.

}
\seealso{
  \code{\link{Ops.clifford}},
  \code{\link{Conj}},
  \code{\link{rcliff}}
}
\examples{


Mod(rcliff())


# Perwass, p68, asserts that if A is a k-blade, then (in his notation)
# AA == A*A.

# In package idiom, A*A == A \%star\% A:

A <- rcliff()          
Mod(A*A - A \%star\% A)  # meh

A <- rblade()
Mod(A*A - A \%star\% A)  # should be small



}

