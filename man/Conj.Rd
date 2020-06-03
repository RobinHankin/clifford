\name{Conj}
\alias{Conj.clifford}
\alias{Conj}
\alias{dagger}
\title{Conjugate of a Clifford object}
\description{\loadmathjax
  The \dQuote{conjugate} of a Clifford object is defined by
  Perwass in definition 2.9, p59.}
\usage{\method{Conj}{clifford}(z)}
\arguments{\item{z}{Clifford object}}
\details{

  Perwass uses a dagger to indicate Conjugates, as in
  \mjeqn{A^\dagger}{Ad} (this does not render in text versions; see a
  PDF).  Conjugation is linear in the sense that
  \mjeqn{\left(A+B\right)^\dagger=A^\dagger+B^\dagger}{(A+B)d=Ad+Bd} and
  \mjeqn{\left(xA\right)^\dagger=x\left(A^\dagger\right)}{(xA)d=x(Ad)}.
  So it suffices to consider only single terms.  If

  \mjdeqn{
    A_{\langle k\rangle}
    =
    \bigwedge_{i=1}^k a_i
  }{
    omitted
  }

  Then
    
  \mjdeqn{
    A_{\langle k\rangle}^\dagger
    =
    \left(a_1\wedge\ldots\wedge a_k\right)^\dagger
    =
    a_k^\dagger\wedge\ldots\wedge a_1^\dagger
    =
    \bigwedge_{i=1}^k a_i^\dagger
  }{
    omitted
  }

  Perwass gives the following theorem (3.58, p70]:
  
  Given blades \mjeqn{A_{\langle k\rangle}, B_{\langle l\rangle}}{A_<k>,
  B_<k>}, then
  
  \mjdeqn{
    \left(
    A_{\langle k\rangle}\wedge B_{\langle l\rangle}
    \right)^\dagger
    = 
    B_{\langle l\rangle}^\dagger
    \wedge
    A_{\langle k\rangle}^\dagger
  }{
    omitted; see PDF
  }
  
  and 

  \mjdeqn{
    \left(
    A_{\langle k\rangle} B_{\langle l\rangle}
    \right)^\dagger
    = 
    B_{\langle l\rangle}^\dagger
    A_{\langle k\rangle}^\dagger
  }{
    omitted; see PDF
  }

  See examples for package idiom.
  
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}},\code{\link{rev}}}
\references{C. Perwass 2009. \dQuote{Geometric algebra with applications
    in engineering}.  Springer.
}
\examples{

signature(2)

A <- rblade(g=3)
B <- rblade(g=4)

Conj(A \%^\% B) - Conj(B) \%^\% Conj(A)      # zero to numerical precision
Conj(A * B) - Conj(B) * Conj(A)          # zero to numerical precision


x1 <- rblade(d=9,g=2)
x2 <- rblade(d=9,g=2)
x3 <- rblade(d=9,g=2)
x4 <- rblade(d=9,g=2)

LHS <- Conj(x1 \%^\% x2 \%^\% x3 \%^\% x4)
RHS <- Conj(x4) \%^\% Conj(x3) \%^\% Conj(x2) \%^\% Conj(x1) 
Mod(LHS - RHS) # zero to numerical precision


LHS <- Conj(x1 * x2 * x3 * x4)
RHS <- Conj(x4) * Conj(x3) * Conj(x2) * Conj(x1) 
Mod(LHS - RHS) # zero to numerical precision


signature(0)

}