\name{involution}
\alias{involution}
\alias{involutions}
\alias{Conj}
\alias{Conj.clifford}
\alias{conjugate}
\alias{conj}
\alias{cliffconj}
\alias{dual}
\alias{rev}
\alias{rev.clifford}
\alias{reverse}
\alias{gradeinv}
\alias{neg}
\alias{tilde}
\alias{dagger}
\title{Clifford involutions}
\description{\loadmathjax

  An \dfn{involution} is a function that is its own inverse, or
  equivalently \mjseqn{f(f(x))=x}.  There are several important
  involutions on Clifford objects; these commute past the grade operator
  with \mjeqn{f(\left\langle A\right\rangle_r)=\left\langle
  f(A)\right\rangle_r}{omitted} and are linear: \mjeqn{f(\alpha A+\beta
  B)=\alpha f(A)+\beta f(B)}{omitted}.

  The \dfn{dual} is documented here for convenience, even though it is
  not an involution (applying the dual \emph{four} times is the
  identity).

  \itemize{

    \item The \dfn{reverse} \mjeqn{A^\sim}{omitted} is given by
    \code{rev()} (both Perwass and Dorst use a tilde, as in
    \mjeqn{\tilde{A}}{omitted} or \mjeqn{A^\sim}{A~}.  However, both
    Hestenes and Chisholm use a dagger, as in
    \mjeqn{A^\dagger}{omitted}.  This page uses Perwass's notation).
    The \dfn{reverse} of a term written as a product of basis vectors is
    simply the product of the same basis vectors but written in reverse
    order.  This changes the sign of the term if the number of basis
    vectors is 2 or 3 (modulo 4).  Thus, for example,
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

    \item The \dfn{Conjugate} \mjeqn{A^\dagger}{omitted} is given by
    \code{Conj()} (we use Perwass's notation, def 2.9 p59).  This
    depends on the signature of the Clifford algebra; see
    \code{grade.Rd} for notation.  Given a basis blade
    \mjteqn{e_A}{e_\mathbb{A}}{e_A} with \mjteqn{A\subseteq\left\lbrace
    1,\ldots,p+q\right\rbrace}{\mathbb{A}\subseteq\left\lbrace
    1,\ldots,p+q\right\rbrace}{omitted}, then we have \mjteqn{
    e_A^\dagger = (-1)^m {e_A}^\sim}{e_\mathbb{A}^\dagger = (-1)^m
    {e_\mathbb{A}}^\sim}{omitted}, where \mjteqn{m=\mathrm{gr}_{-}(A)
    }{m=\mathrm{gr}_{-}(\mathbb{A})}{omitted}.  Alternatively, we
    might say \mjdeqn{\left(\left\langle
    A\right\rangle_r\right)^\dagger=(-1)^m(-1)^{r(r-1)/2}\left\langle
    A\right\rangle_r }{omitted} where
    \mjeqn{m=\mathrm{gr}_{-}(\left\langle A\right\rangle_r)}{omitted}
    [NB I have changed Perwass's notation].

    \item The \dfn{main (grade) involution} or \dfn{grade involution}
    \mjeqn{\widehat{A}}{omitted} is given by \code{gradeinv()}.  This
    changes the sign of any term with odd grade: \mjdeqn{
    \widehat{\left\langle A\right\rangle_r} =(-1)^r\left\langle
    A\right\rangle_r}{omitted} (I don't see this in Perwass or Hestenes;
    notation follows Hitzer and Sangwine).  It is a special case of
    grade negation.

    \item The \dfn{grade \eqn{r}-negation}
    \mjeqn{A_{\overline{r}}}{omitted} is given by \code{neg()}.  This
    changes the sign of the grade \eqn{r} component of \eqn{A}.  It is
    formally defined as \mjeqn{A-2\left\langle
    A\right\rangle_r}{A-2<A>_r} but function \code{neg()} uses a more
    efficient method.  It is possible to negate all terms with specified
    grades, so for example we might have \mjeqn{\left\langle
    A\right\rangle_{\overline{\left\lbrace 1,2,5\right\rbrace}} =
    A-2\left( \left\langle A\right\rangle_1 +\left\langle
    A\right\rangle_2+\left\langle A\right\rangle_5\right)}{omitted} and
    the R idiom would be \code{neg(A,c(1,2,5))}.  Note that Hestenes
    uses \dQuote{\mjeqn{A_{\overline{r}}}{omitted}} to mean the same as
    \mjeqn{\left\langle A\right\rangle_r}{omitted}.
    
    \item The \dfn{Clifford conjugate} \mjeqn{\overline{A}}{omitted} is
    given by \code{cliffconj()}.  It is distinct from conjugation
    \mjeqn{A^\dagger}{omitted}, and is defined in Hitzer and Sangwine as
    
    \mjdeqn{\overline{\left\langle A\right\rangle_r} =
      (-1)^{r(r+1)/2}\left\langle A\right\rangle_r.}{omitted}

    \item The \dfn{dual} \mjseqn{C^*} of a clifford object \mjseqn{C} is
    given by \code{dual(C,n)}; argument \code{n} is the dimension of the
    underlying vector space.  Perwass gives
    \mjdeqn{C^*=CI^{-1}}{omitted}

    where \mjeqn{I=e_1e_2\ldots e_n}{omitted} is the unit pseudoscalar
    [note that Hestenes uses \mjeqn{I}{I} to mean something different].
    The dual is sensitive to the signature of the Clifford algebra
    \emph{and} the dimension of the underlying vector space.
  }
}

\usage{
\method{rev}{clifford}(x)
\method{Conj}{clifford}(z)
cliffconj(z)
neg(C,n)
gradeinv(C)
}
\arguments{
  \item{C,x,z}{Clifford object}
  \item{n}{Integer vector specifying grades to be negated in \code{neg()}}
}


\author{Robin K. S. Hankin}
\seealso{\code{\link{grade}}}
\examples{

x <- rcliff()
rev(x)


A <- rblade(g=3)
B <- rblade(g=4)
rev(A \%^\% B) == rev(B) \%^\% rev(A)  # should be TRUE
rev(A * B) == rev(B) * rev(A)          # should be TRUE

a <- rcliff()
dual(dual(dual(dual(a,8),8),8),8) == a # should be TRUE

}
