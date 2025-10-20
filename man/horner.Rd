\name{horner}
\alias{horner}
\title{Horner's method}
\description{Horner's method for Clifford objects}
\usage{horner(P, v)}
\arguments{
  \item{P}{A Clifford object}
  \item{v}{Numeric vector of coefficients}
}
\details{
  Given a polynomial

  \deqn{p(x) = a_0 +a_1+a_2x^2+\cdots + a_nx^n}{omitted; see PDF}

  it is possible to express \eqn{p(x)} in the algebraically equivalent
  form

  \deqn{p(x) = a_0 + x\left(a_1+x\left(a_2+\cdots + x\left(a_{n-1} +xa_n
\right)\cdots\right)\right)}{omitted; see PDF}

which is much more efficient for evaluation, as it requires only \eqn{n}
multiplications and \eqn{n} additions, and this is optimal.  The output
of \code{horner()} depends on the \code{signature()}.

}
  
\author{Robin K. S. Hankin}
\note{

  Horner's method is not as cool for Clifford objects as it is for
  (e.g.) multivariate polynomials or \code{freealg} objects.  This is
  because powers of Clifford objects don't get more complicated as the
  power increases.
}
\examples{

horner(1 + e(1:3) + e(2:3), 1:6)

rcliff() |> horner(1:4)

}
\keyword{symbolmath}
