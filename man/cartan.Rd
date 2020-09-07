\name{cartan}
\alias{cartan}
\alias{cartan_inverse}
\title{Cartan map between clifford algebras}
\description{\loadmathjax

  Cartan's map isomorphisms from \mjseqn{Cl(p,q)} to
  \mjseqn{Cl(p-4,q+4)} and \mjseqn{Cl(p+4,q-4)}

}
\usage{
cartan(C, n = 1)
cartan_inverse(C, n = 1)
}
\arguments{
  \item{C}{Object of class \code{clifford}}
  \item{n}{Strictly positive integer}
}
\value{
  Returns an object of class \code{clifford}.  The default value
 \code{n=1} maps \mjseqn{Cl(4,q)} to \mjseqn{Cl(0,q+4)}
 (\code{cartan()}) and \mjseqn{Cl(0,q)} to \mjseqn{Cl(4,q-4)}.
}

\references{
E. Hitzer and S. Sangwine 2017.  \dQuote{Multivector and
multivector matrix inverses in real Clifford algebras}, \emph{Applied
Mathematics and Computation}. 311:3755-89
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{clifford}}}
\examples{

a <- rcliff(d=7)   # Cl(4,3)
b <- rcliff(d=7)   # Cl(4,3)
signature(4)       # e1^2 = e2^2 = e3^2 = e4^2 = +1; e5^2 = ... = -1
ab <- a*b          # multiplication in Cl(4,3)

signature(0)   # e1^2 = ... = -1
cartan(a)*cartan(b) == cartan(ab) # multiplication in Cl(0,7)

signature(Inf)  # restore default
}