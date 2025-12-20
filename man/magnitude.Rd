\name{magnitude}
\alias{magnitude}
\alias{mod}
\alias{Mod}
\alias{Mod.clifford}
\title{Magnitude of a clifford object}
\usage{
\method{Mod}{clifford}(z)
}
\arguments{
  \item{z}{Clifford objects}
}
\description{

  Following Perwass, the \dfn{magnitude} of a multivector is defined as
  
  \deqn{\left|\left|A\right|\right| = \sqrt{A\ast A}}{omitted; see PDF}
  
  Where \eqn{A\ast A}{?} denotes the Euclidean scalar product
  \code{eucprod()}.
}
\author{Robin K. S. Hankin}
\details{

  For any multivector \eqn{A}, the Euclidean scalar product \eqn{A\ast
    A} is never negative, so the square root is always defined.

  The function body of \code{Mod.clifford()} is
  \code{sqrt(abs(eucprod(z)))}; the \code{abs()} is needed to avoid
  numerical roundoff errors in \code{eucprod()} giving a negative value.
  }

\note{

If you want the square, \eqn{\left|\left|A\right|\right|^2}{||A||^2} and
not \eqn{\left|\left|A\right|\right|}{||A||}, it is faster and more
accurate to use \code{eucprod(A)} [rather than \code{Mod(A)^2}], because
this avoids a needless square root.

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
