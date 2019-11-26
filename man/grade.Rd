\name{grade}
\alias{grade}
\title{The grade of a clifford object}
\description{The grade of a blade is the number of basis vectors in it}
\usage{
grade(C, n)
grades(C, n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{C}{Cliffor object}
  \item{n}{Integer}
}
\details{

The grade of a blade is the number of basis vectors in it.  Thus the
grade of \eqn{e_1}{e1} is 1, and the grade of \eqn{e_1 e_2 e_5}{e1 e2
e5} is 3.

Function \code{grades()} returns an (unordered) vector specifying the
grades of the constituent blades.

Function \code{grade(C,n)} returns a clifford object with just the
elements of grade \code{n}.
}
\author{Robin K. S. Hankin}
\examples{

a <- clifford(sapply(seq_len(7),seq_len),seq_len(7))
grades(a)
grade(a,5)


}