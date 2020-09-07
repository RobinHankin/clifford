\name{cartan}
\alias{cartan}
\alias{cartan_inverse}
\title{Cartan map between clifford algebras}
\description{\loadmathjax

  Cartan's map isomorphisms from \mjseqn{Cl(p,q)} to
  \mjseqn{Cl(p-4,q+4)} and \mjseqn{Cl(p+4,q-4)}

}
\usage{cartan(C, n = signature()-3)
cartan_inverse(C, n = signature()-3)
}
\arguments{
  \item{C}{Object of class \code{clifford}}
  \item{n}{Strictly positive integer}
}
\value{
Returns an object of class \code{clifford}.  The default value 
}
\references{
E. Hitzer and S. Sangwine 2017.  \dQuote{Multivector and
multivector matrix inverses in real Clifford algebras}, \emph{Applied
Mathematics and Computation}. 311:3755-89
}
\author{Robin K. S. Hankin}
\note{
the default value of n is designed so that ...
}

\seealso{\code{\link{clifford}}}
\examples{
2+3
}