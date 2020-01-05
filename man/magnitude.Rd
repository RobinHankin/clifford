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
    A\ast B=\left<AB\right>_0
  }{
    A asterisk B=<AB>_0
  }

  In package idiom the scalar product is given by \code{A \%star\% B} or
  \code{scalprod(A,B)}.
  
  The \dfn{Euclidean product} (or \dfn{Euclidean scalar product}) of two
  clifford objects is defined as 

  \deqn{
    A\star B=A\ast B^\dag=\left<AB^\dag\right>_0
  }{
    omitted: see PDF
  }

  In package idiom the Euclidean scalar product is given by \code{A\%
  esp\%B} or \code{eucprod(A,B)}.

  Note that the scalar product \eqn{A\ast A} might be negative, but the
  Euclidean product \eqn{A\star A\geq 0}{A*A >=0}
  
  We define the \dfn{magnitude} \eqn{\left|\left|A\right|\right|}{||A||}
  of a clifford object \eqn{A} to be \eqn{\sqrt{A\star A}}{see PDF}; in
  package idiom it is given by \code{Mod(A)}.

}
\author{Robin K. S. Hankin}
\note{
Hestenes uses an asterisk for scalar product as in \eqn{A*B}, but in
package idiom, the asterisk is reserved for geometric product.

If you want the square, \eqn{\left|A\right|^2}{|A|^2} and not
\eqn{\left|A\right|}{|A|}, it is faster and more accurate to use
\code{scalprod(A)}, because \code{Mod(A)^2} takes a needless square
root).

There is a nice example of scalar product at \code{rcliff.Rd}.

}
\seealso{\code{\link{Ops.clifford}},\code{\link{rcliff}}
}
\examples{


Mod(rcliff())


# Perwass, p68, asserts that if A is a k-blade, then (in his notation)
# AA == A*A.

# In package idiom, A*A == A \%star\% A:

A <- rblade()
Mod(A*A - A \%star\% A)  # should be small

}

