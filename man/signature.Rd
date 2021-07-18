\name{signature}
\alias{signature}
\alias{sig}
\alias{is_ok_sig}
\alias{showsig}
\alias{print.sigobj}
\alias{mymax}
\title{The signature of the Clifford algebra}
\description{Getting and setting the signature of the Clifford algebra}
\usage{
signature(p,q=0)
is_ok_sig(s)
showsig(s)
\method{print}{sigobj}(x,...)
}
\arguments{
  \item{s,p,q}{Integers, specifying number of positive elements on the
    diagonal of the quadratic form, with \code{s=c(p,q)}}
  \item{x}{Object of class \code{sigobj}}
  \item{...}{Further arguments, currently ignored}
}
\details{\loadmathjax

The signature functionality is modelled on \code{lorentz::sol()} which
gets and sets the speed of light.

Clifford algebras require a bilinear form on \mjteqn{R^n}{\mathbb{R}^n}{R^n}
\mjeqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}, usually written

\mjdeqn{\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
  +x_p^2-x_{p+1}^2-\cdots -x_{p+q}^2
}{
  <x,x>=x_1^2+...+x_p^2-x_{p+1}^2-...-x_{p+q}^2
}

where \mjeqn{p+q=n}{p+q=n}.  With this quadratic form the vector space
is denoted \mjteqn{R^{p,q}}{\mathbb{R}^{p,q}}{R^{p,q}} and we say that
\mjseqn{(p,q)} is the \dfn{signature} of the bilinear form
\mjeqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}.  This gives rise to
the Clifford algebra \mjeqn{C_{p,q}}{C_{p,q}}.

If the signature is \mjseqn{(p,q)}, then we have

\mjdeqn{
  e_i e_i = \cases{
  +1 & if $1\leq i\leq p$\cr
  -1 & if $p+1\leq i\leq p+q$\cr
  0  & if $i>p+q$.\cr
  }
}{
  omitted
}

Note that \mjseqn{(p,0)} corresponds to a positive-semidefinite
quadratic form in which \mjeqn{e_ie_i=+1}{omitted} for all \mjeqn{i\leq
p}{i<=p} and \mjeqn{e_ie_i=0}{omitted} for all \mjseqn{i > p}.
Similarly, \mjseqn{(0,q)} corresponds to a negative-semidefinite
quadratic form in which \mjeqn{e_ie_i=-1}{omitted} for all \mjeqn{i\leq
q}{i<=q} and \mjeqn{e_ie_i=0}{omitted} for all \mjseqn{i > q}.

Package idiom for a strictly positive-definite quadratic form would be
to specify infinite \mjseqn{p} [in which case \mjseqn{q} is irrelevant]
and for a strictly negative-definite quadratic form we would need
\mjeqn{p=0,q=\infty}{omitted}.

If we specify \mjeqn{e_ie_i=0}{omitted} for all \mjseqn{i}, then the
operation reduces to the wedge product of a Grassman algebra.  Package
idiom for this is to set \mjseqn{p=0,q=0}, but this is not recommended:
use the \pkg{stokes} package for Grassman algebras, which is much more
efficient and uses nicer idiom.

Function \code{signature(p,q)} returns the signature silently; but
setting option \code{show_signature} to \code{TRUE} makes
\code{signature()} have the side-effect of calling \code{showsig()}.
This changes the default prompt to display the signature, much like
\code{showSOL} in the \code{lorentz} package.  There is special
dispensation for \dQuote{infinite} \mjseqn{p} or \mjseqn{q}; the
\code{sigobj} class ensures that a near-infinite integer such as
\code{.Machine$integer.max} will be printed as \dQuote{\code{Inf}}
rather than \dQuote{\code{2147483647}}.

Function \code{is_ok_sig()} is a helper function that checks for a
proper signature.

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


# Nice mapping from Cl(0,2) to the quaternions (loading clifford and
# onion simultaneously is discouraged):

# library("onion")
# signature(0,2)
# Q1 <- rquat(1)
# Q2 <- rquat(1)
# f <- function(H){Re(H)+i(H)*e(1)+j(H)*e(2)+k(H)*e(1:2)}
# f(Q1)*f(Q2) - f(Q1*Q2) # zero to numerical precision
# signature(Inf)

}
