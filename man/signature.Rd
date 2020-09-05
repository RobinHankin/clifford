\name{signature}
\alias{signature}
\alias{sig}
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

Clifford algebras require a bilinear form on \mjteqn{R^n}{\mathbb{R}^n}{R^n}
\mjeqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}, usually written

\mjdeqn{\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
  +x_p^2-x_{p+1}^2-\cdots -x_{p+q}^2
}{
  <x,x>=x_1^2+...+x_p^2-x_{p+1}^2-...-x_{p+q}^2
}

where \mjeqn{p+q=n}{p+q=n}.  With this quadratic form the vector space
is denoted \mjteqn{R^{p,q}}{\mathbb{R}^{p,q}}{R^{p,q}} and we say that
\eqn{p} is the \dfn{signature} of the bilinear form
\mjeqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}.  This gives rise to
the Clifford algebra \mjeqn{C_{p,q}}{C_{p,q}}.

If the signature is \mjeqn{p\geq 0}{p,p >=0}, then we have

\mjdeqn{
  e_i e_i = \cases{
  +1 & if $i\leq p$\cr
  -1 & if $i>p$.\cr
  }
}{
  omitted
}

Note that \mjseqn{p=0} corresponds to a negative-definite quadratic form
in which \mjeqn{e_ie_i=-1}{omitted} for all \mjseqn{i}.  If the
quadratic form is positive-definite, we have \mjeqn{e_ie_i=+1}{omitted}
for all \mjseqn{i}.  Logically this corresponds to
\mjeqn{p=\infty}{omitted}.  Package idiom for this case is to use
\code{signature(Inf)}, although internally the signature is set to
\code{.Machine$integer.max} (a near-infinite integer).

If we specify \mjeqn{e_ie_i=0}{omitted} for all \mjseqn{i}, then the
operation reduces to the wedge product of a Grassman algebra.  Package
idiom for this is to specify a \emph{negative} value for \eqn{p}.  But
this is not recommended: use the \pkg{wedge} package for Grassman
algebras, which is much more efficient and uses nicer idiom.

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