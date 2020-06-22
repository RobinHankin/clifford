\name{rev}
\alias{rev.clifford}
\alias{rev}
\title{Reverse of a Clifford object}
\description{\loadmathjax

The \dfn{reverse} is a linear operator on Clifford objects.  Both
Perwass and Dorst use a tilde, as in \mjeqn{\tilde{A}}{omitted} or
\mjeqn{A^\sim}{A~}. However, both Hestenes and Chisholm use a dagger, as
in \mjeqn{A^\dagger}{omitted}.  This page uses Perwass's notation.

The \dfn{reverse} of a term written as a product of basis vectors is
simply the product of the same basis vectors but written in reverse
order.  This changes the sign of the term if the number of basis vectors
is 2 or 3 (modulo 4).  Thus, for example,
\mjeqn{\left(e_1e_2e_3\right)^\sim=e_3e_2e_1=-e_1e_2e_3}{omitted} and
\mjeqn{\left(e_1e_2e_3e_4\right)^\sim=e_4e_3e_2e_1=+e_1e_2e_3e_4}{omitted}.
Formally, if \mjeqn{X=e_{i_1}\ldots e_{i_k}}{omitted}, then
\mjeqn{\tilde{X}=e_{i_k}\ldots e_{i_1}}{omitted}.

The reverse is an involution in the sense that the reverse of the
reverse is the identity operation.  We have

\mjdeqn{
  A^{\sim\sim}=A\qquad
  \left(AB\right)^\sim=\tilde{B}\tilde{A}\qquad
  \left(A+B\right)^\sim=\tilde{A} + \tilde{B}\qquad.
}{
  omitted.
}


\mjdeqn{
  \left\langle A^\sim\right\rangle=\left\langle A\right\rangle\qquad
  \left\langle A^\sim\right\rangle_r=\widetilde{\left\langle
  A\right\rangle_r}=(-1)^{r(r-1)/2}\left\langle A\right\rangle_r
}{
  omitted
}

where \mjeqn{\left\langle A\right\rangle}{<A>} is the grade operator;
and it is easy to prove that

\mjdeqn{
  \left\langle AB\right\rangle_r=(-1)^{r(r-1)/2}\left\langle\tilde{B}\tilde{A}\right\rangle_r
}{
  omitted
}

Compare the Conjugate (documented at \code{Conj.Rd}), which is dependent
on the signature of the Clifford algebra.

}
\usage{
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
