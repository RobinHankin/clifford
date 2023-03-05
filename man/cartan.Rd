\name{cartan}
\alias{cartan}
\alias{cartan_inverse}
\title{Cartan map between clifford algebras}
\description{\loadmathjax

  Cartan's map isomorphisms from \mjeqn{\operatorname{Cl}(p,q)}{Cl(p,q)}
  to \mjeqn{\operatorname{Cl}(p-4,q+4)}{Cl(p-4,q+4)} and
  \mjseqn{\operatorname{Cl}(p+4,q-4)}{Cl(p+4,q-4)}

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
  \code{n=1} maps \mjeqn{\operatorname{Cl}(4,q)}{Cl(4,q)} to
  \mjeqn{\operatorname{Cl}(0,q+4)}{Cl(0,q+4)} (\code{cartan()}) and
  \mjeqn{\operatorname{Cl}(0,q)}{Cl(0,q)} to
  \mjeqn{\operatorname{Cl}(4,q-4)}{Cl(4,q-4)}.
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
signature(4,3)     # e1^2 = e2^2 = e3^2 = e4^2 = +1; e5^2 = e6^2=e7^2 = -1
ab <- a*b          # multiplication in Cl(4,3)

signature(0,7)   # e1^2 = ... = e7^2 = -1
cartan(a)*cartan(b) == cartan(ab) # multiplication in Cl(0,7); should be TRUE

signature(Inf)  # restore default
}
