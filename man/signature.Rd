\name{signature}
\alias{signature}
\alias{is_ok_sig}
\alias{mymax}
\title{The signature of the Clifford algebra}
\description{Getting and setting the signature of the Clifford algebra}
\usage{
signature(s)
is_ok_sig(s)
mymax(s)
}
\arguments{
  \item{s}{Integer, specifying number of positive elements on the
    diagonal of the quadratic form}
}
\details{\loadmathjax
The function is modelled on \code{lorentz::sol()} which gets and sets
the speed of light.

Clifford algebras require a bilinear form on \mjeqn{R^n}{R^n}
\mjeqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}, usually written

\mjdeqn{\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
  +x_p^2-x_{p+1}^2-\cdots -x_{p+q}^2
}{
  <x,x>=x_1^2+...+x_p^2-x_{p+1}^2-...-x_{p+q}^2
}

where \mjeqn{p+q=n}{p+q=n}.  With this quadratic form the vector space
is denoted \eqn{R^{p,q}}, and we say that \eqn{p} is the signature of
the bilinear form \eqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}.
This gives rise to the Clifford algebra \mjeqn{C_{p,q}}{C_{p,q}}.

If the quadratic form is positive-definite, package idiom is to use the
default special value \eqn{p=0} (which means that zero entries on the
main diagonal are negative).

Specifying a \emph{negative} value for \eqn{p} sets the quadratic form
to be identically zero, reducing the geometric product to the exterior
wedge product and thus a Grassman algebra.  But use the \pkg{wedge}
package for this, which is much more efficient and uses nicer idiom.

Function \code{is_ok_sig()} is a helper function that checks for a
proper signature.

Function \code{mymax()} is a helper function that avoids warnings from
\code{max()} when given an empty argument.

}
\author{Robin K. S. Hankin}
\examples{



e1 <- clifford(list(1),1)
e2 <- clifford(list(2),1)


signature()


e1*e1
e2*e2

signature(1)
e1*e1
e2*e2   #note sign

signature(Inf)
e2*e2

}