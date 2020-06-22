\name{grade}
\alias{grade}
\alias{grades}
\alias{gradesplus}
\alias{gradesminus}
\alias{gradeplus}
\alias{grademinus}
\title{The grade of a clifford object}
\description{\loadmathjax
The grade of a term is the number of basis vectors in it.}
\usage{
grade(C, n, drop=TRUE)
grades(x)
gradesplus(x)
gradesminus(x)
}
\arguments{
  \item{C,x}{Clifford object}
  \item{n}{Integer vector specifying grades to extract}
  \item{drop}{Boolean, with default \code{TRUE} meaning to coerce a
    constant Clifford object to numeric, and \code{FALSE} meaning not
    to}
}
\details{

A \emph{term} is a single expression in a Clifford object.  It has a
coefficient and is described by the basis vectors it comprises.  Thus
\code{4e_234} is a term but \code{1e3 + 2e5} is not.
  
The \emph{grade} of a term is the number of basis vectors in it.  Thus
the grade of \eqn{e_1}{e1} is 1, and the grade of
\eqn{e_{125}=e_1e_2e_5}{e_125=e1 e2 e5} is 3.  The grade operator
\mjeqn{\left\langle\cdot\right\rangle_r}{<.>_r} is used to extract terms
of a particular grade, with

\mjdeqn{
  A=\left\langle A\right\rangle_0 + 
    \left\langle A\right\rangle_1 + 
    \left\langle A\right\rangle_2 + \cdots = \sum_r\left\langle A\right\rangle_r
}{
  A = <A>_0 + <A>_1 + <A>_2 +... = sum <A>_r
}

for any Clifford object \eqn{A}.  Thus \mjeqn{\left\langle
A\right\rangle_r}{<A>_r} is said to be homogenous of grade \eqn{r}.
Hestenes sometimes writes subscripts that specify grades using an
overbar as in \mjeqn{\left\langle
A\right\rangle_{\overline{r}}}{omitted}.  It is conventional to denote
the zero-grade object \mjeqn{\left\langle A\right\rangle_0}{<A>_0} as
simply \mjeqn{\left\langle A\right\rangle}{<A>}.

We have

\mjdeqn{
\left\langle A+B\right\rangle_r=\left\langle A\right\rangle_r + \left\langle B\right\rangle_r\qquad
\left\langle\lambda A\right\rangle_r=\lambda\left\langle A\right\rangle_r\qquad
\left\langle\left\langle A\right\rangle_r\right\rangle_s=\left\langle A\right\rangle_r\delta_{rs}.
}{
  omitted; see PDF
}
  
Function \code{grades()} returns an (unordered) vector specifying the
grades of the constituent terms.

Function \code{gradesplus()} returns the same but counting only basis
vectors that square to \eqn{+1}, and \code{gradesminus()} counts only
basis vectors that square to \eqn{-1}.  These defined by Perwass, page
57.

Function \code{grade(C,n)} returns a clifford object with just the
elements of grade \code{g}, where \code{g \%in\% n}.

The zero grade term, \code{grade(C,0)}, is given more naturally by
\code{const(C)}.

Function \code{c_grade()} is a helper function that is documented at
\code{Ops.clifford.Rd}.

}
\author{Robin K. S. Hankin}
\note{
  In the C code, \dQuote{term} has a slightly different meaning,
  referring to the vectors without the associated coefficient.
}
\references{C. Perwass 2009. \dQuote{Geometric algebra with applications
    in engineering}.  Springer.
  }
\examples{

a <- clifford(sapply(seq_len(7),seq_len),seq_len(7))
grades(a)
grade(a,5)


}
