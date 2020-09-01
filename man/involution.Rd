\name{involution}
\alias{involution}
\alias{involutions}
\alias{Conj}
\alias{conjugate}
\alias{conj}
\alias{rev}
\alias{reverse}
\alias{neg}
\title{Clifford involutions}
\description{\loadmathjax

  An \dfn{involution} is a function that is its own inverse, or
  equivalently \mjseqn{f(f(x))=x}.  There are several important
  involutions; these commute past the grade operator, as in
  \mjeqn{\left\langle A\right\rangle_r}{<A>_r}, and are linear.
  
  \itemize{

    \item The \dfn{reverse} is a linear operator on Clifford objects.
    Both Perwass and Dorst use a tilde, as in \mjeqn{\tilde{A}}{omitted}
    or \mjeqn{A^\sim}{A~}.  However, both Hestenes and Chisholm use a
    dagger, as in \mjeqn{A^\dagger}{omitted}.  This page uses Perwass's
    notation.  The \dfn{reverse} of a term written as a product of basis
    vectors is simply the product of the same basis vectors but written
    in reverse order.  This changes the sign of the term if the number
    of basis vectors is 2 or 3 (modulo 4).  Thus, for example,
    \mjeqn{\left(e_1e_2e_3\right)^\sim=e_3e_2e_1=-e_1e_2e_3}{omitted}
    and
    \mjeqn{\left(e_1e_2e_3e_4\right)^\sim=e_4e_3e_2e_1=+e_1e_2e_3e_4}{omitted}.
    Formally, if \mjeqn{X=e_{i_1}\ldots e_{i_k}}{omitted}, then
    \mjeqn{\tilde{X}=e_{i_k}\ldots e_{i_1}}{omitted}.

    \mjdeqn{\left\langle
      A^\sim\right\rangle_r=\widetilde{\left\langle
	A\right\rangle_r}=(-1)^{r(r-1)/2}\left\langle A\right\rangle_r
    }{
      omitted
    }

    Perwass shows that \mjeqn{\left\langle
      AB\right\rangle_r=(-1)^{r(r-1)/2}\left\langle\tilde{B}\tilde{A}\right\rangle_r
      }{ omitted}.

    \item The \dfn{Conjugate} \mjeqn{A^\dagger}{omitted} (Perwass's
    notation) depends on the signature of the Clifford algebra; see
    \code{grade.Rd} for notation.  Given a basis blade
    \mjteqn{e_A}{e_\mathbb{A}}{e_A} with \mjteqn{A\subseteq\left\lbrace
    1,\ldots,p+q\right\rbrace}{\mathbb{A}\subseteq\left\lbrace
    1,\ldots,p+q\right\rbrace}{omitted}, then we have 
  \mjteqn{
    e_A^\dagger           =   (-1)^m {e_A}^\sim
  }{
    e_\mathbb{A}^\dagger  = (-1)^m {e_\mathbb{A}}^\sim
  }{
    omitted}, where
  \mjteqn{
    m=\mathrm{gr}_{-}(A)
  }{
    r=\mathrm{gr}_{-}(\mathbb{A})
  }{
    omitted
  }.  Alternatively, we might say 
    \mjdeqn{\left(\left\langle
    A\right\rangle_r\right)^\dagger=(-1)^m(-1)^{r(r-1)/2}\left\langle A\right\rangle_r
  }{omitted} where
  \mjeqn{m=\mathrm{gr}_{-}(\left\langle A\right\rangle_r)}{omitted} [NB
 I have changed Perwass's notation].

  \item The \dfn{main involution} or \dfn{grade involution}
  \mjeqn{\widehat{A}}{omitted} simply changes the sign of any term with
  odd grade:
  \mjdeqn{
    \widehat{\left\langle A\right\rangle_r}
    =(-1)^r\left\langle A\right\rangle_r}{omitted}
(I don't see this in Perwass or Hestenes).
}

\item The \dfn{grade negation} operation applied to Clifford multivector
\eqn{A} changes the sign of the grade \eqn{r} component of \eqn{A}.  It
is formally defined as \eqn{A-2\left<A\right>_r}{A-2<A>_r}.

}

}

\usage{
\method{rev}{clifford}(x)
\method{Conj}{clifford}(x)
\method{neg}{clifford}(x)
\method{rev}{clifford}(x)
}
\arguments{\item{x}{Clifford object}}
\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}},\code{\link{Conj}}}
\examples{

x <- rcliff()
rev(x)


A <- rblade(g=3)
B <- rblade(g=4)
rev(A \%^\% B) == rev(B) \%^\% rev(A)  # should be small
rev(A * B) == rev(B) * rev(A)            # should be small
}
