\name{signature}
\alias{signature}
\alias{sig}
\alias{is_ok_sig}
\alias{showsig}
\alias{print.sigobj}
\alias{mymax}
\alias{maxdim}
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
\details{

The signature functionality is modelled on the \CRANpkg{lorentz}
package; \code{clifford::signature()} operates in the same way as
\code{lorentz::sol()} which gets and sets the speed of light.  The idea
is that both the speed of light and the signature of a Clifford algebra
are generally set once, at the beginning of an \R session, and
subsequently change only very infrequently.

Clifford algebras require a bilinear form
\eqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>} on
\eqn{\mathbb{R}^n}{R^n}.  If \eqn{{\mathbf
x}=\left(x_1,\ldots,x_n\right)}{omitted} we define

\deqn{\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
  +x_p^2-x_{p+1}^2-\cdots -x_{p+q}^2
}{
  <x,x>=x_1^2+...+x_p^2-x_{p+1}^2-...-x_{p+q}^2
}

where \eqn{p+q=n}{p+q=n}.  With this quadratic form the vector space
is denoted \eqn{\mathbb{R}^{p,q}}{R^{p,q}} and we say that
\eqn{(p,q)} is the \dfn{signature} of the bilinear form
\eqn{\left\langle\cdot,\cdot\right\rangle}{<.,.>}.  This gives rise to
the Clifford algebra \eqn{C_{p,q}}{C_{p,q}}.

If the signature is \eqn{(p,q)}, then we have

\deqn{
  e_i e_i =   +1\, (\mbox{if } 1\leq i\leq p), 
              -1\, (\mbox{if } p+1\leq i\leq p+q),
               0\, (\mbox{if } i>p+q).
  }{
  omitted
}

Note that \eqn{(p,0)} corresponds to a positive-semidefinite
quadratic form in which \eqn{e_ie_i=+1}{omitted} for all \eqn{i\leq
p}{i<=p} and \eqn{e_ie_i=0}{omitted} for all \eqn{i > p}.
Similarly, \eqn{(0,q)} corresponds to a negative-semidefinite
quadratic form in which \eqn{e_ie_i=-1}{omitted} for all \eqn{i\leq
q}{i<=q} and \eqn{e_ie_i=0}{omitted} for all \eqn{i > q}.

A strictly positive-definite quadratic form is specified by infinite
\eqn{p} [in which case \eqn{q} is irrelevant], and
\code{signature(Inf)} implements this.  For a strictly negative-definite
quadratic form we would have \eqn{p=0,q=\infty}{omitted} which would
be \code{signature(0,Inf)}.

If we specify \eqn{e_ie_i=0}{omitted} for all \eqn{i}, then the
operation reduces to the wedge product of a Grassmann algebra.  Package
idiom for this is to set \eqn{p=q=0} with \code{signature(0,0)}, but
this is not recommended: use the \CRANpkg{stokes} package for Grassmann
algebras, which is much more efficient and uses nicer idiom.

Function \code{signature(p,q)} returns the signature invisibly; but
setting option \code{show_signature} to \code{TRUE} makes
\code{showsig()} [which is called by \code{signature()}] change the
default prompt so it displays the signature, much like \code{showSOL} in
the \CRANpkg{lorentz} package.  Note that changing the signature changes
the prompt immediately (if \code{show_signature} is \code{TRUE}), but
changing option \code{show_signature} has no effect until
\code{showsig()} is called.

Calling \code{signature()} [that is, with no arguments] returns an
object of class \code{sigobj} with elements corresponding to \eqn{p} and
\eqn{q}.  There is special dispensation for \dQuote{infinite} \eqn{p} or
\eqn{q}: the \code{sigobj} class ensures that a near-infinite integer
such as \code{.Machine$integer.max} will be printed as
\dQuote{\code{Inf}} rather than, for example,
\dQuote{\code{2147483647}}.

Function \code{is_ok_sig()} is a helper function that checks for a
proper signature.  If we set \code{signature(p,q)}, then technically
\eqn{n>p+q} implies \eqn{e_n^2=0}{omitted}, but usually we are not
interested in \eqn{e_n} when \eqn{n>p+q} and want this to be an error.
Option \code{maxdim} specifies the maximum value of \eqn{n}, with
default \code{NULL} corresponding to infinity.  If \eqn{n} exceeds
\code{maxdim}, then \code{is_ok_sig()} throws an error.  Note that it is
sometimes fine to have \code{maxdim > p+q} [and indeed this is useful in
the context of dual numbers].  This option is intended to be a
super-strict safety measure.

\preformatted{
> e(6)
Element of a Clifford algebra, equal to
+ 1e_6
> options(maxdim=5)
> e(5)
Element of a Clifford algebra, equal to
+ 1e_5
> e(6)
Error in is_ok_clifford(terms, coeffs) : option maxdim exceeded
}

}
\author{Robin K. S. Hankin}
\examples{


signature()

e(1)^2
e(2)^2

signature(1)
e(1)^2
e(2)^2   # note sign

signature(3,4)
sapply(1:10,function(i){drop(e(i)^2)})


signature(Inf)   # restore default




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
