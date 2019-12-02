\name{magnitude}
\alias{magnitude}
\alias{mod}
\alias{scalprod}
\alias{scalar_product}
\title{Scalar products of clifford objects}
\description{

  The scalar product of two clifford objects is defined as the
  zero-grade component of their geometric product:

  \deqn{
    A*B=\left<AB\right>_0
  }{
    A*B=<AB>_0
  }

The magnitude \eqn{\left|A\right|}{|A|} of a clifford object \eqn{A} is
defined by \eqn{\left|A\right|^2=A^\dag *A}{?}; in package idiom it is
given by \code{mod(A)}.

}
\usage{
scalprod(C1,C2)
mod(C)
}
\arguments{ \item{C,C1,C2}{Clifford objects}}
\author{Robin K. S. Hankin}
\note{
Hestenes uses an asterisk for scalar product as in \eqn{A*B}, but in
package idiom, the asterisk is reserved for geometric product.

If you want \eqn{\left|A\right|^2}{|A|^2} and not
\eqn{\left|A\right|}{|A|}, it is faster and more accurate to use
\code{scalprod(A)} (because \code{mod(A)^2} takes a needless square
root).

}
\seealso{\code{\link{Ops.clifford}}}
\examples{


mod(rcliff())
}

