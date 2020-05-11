\name{rev}
\alias{rev.clifford}
\alias{rev}
\title{Reverse of a Clifford object}
\description{\loadmathjax

The \dQuote{reverse} of a term is simply the basis vectors written in
reverse order; this changes the sign of the term if the number of basis
vectors is 2 or 3 (modulo 4).  Taking the reverse is a linear operation.

Both Hestenes and Chisholm use a dagger to denote the reverse of
\mjeqn{A}{A}, as in \mjeqn{A^\dagger}{omitted}.  But both Perwass and Dorst use a
tilde, as in \mjeqn{\tilde{A}}{omitted}.

\mjdeqn{
  \left(A^\dagger\right)^\dagger=A\qquad
  \left(AB\right)^\dagger=B^\dagger A^\dagger\qquad
  \left(A+B\right)^\dagger=A^\dagger+B^\dagger\qquad
  \left\langle A^\dagger\right>=\left\langle A\right\rangle
}{
  omitted
}

where \mjeqn{\left\langle A\right\rangle}{<A>} is the grade operator;
and it is easy to prove that

\mjdeqn{
  \left\langle A^\dagger\right\rangle_r=\left\langle
  A\right\rangle^\dagger_r=(-1)^{r(r-1)/2}\left\langle A\right\rangle_r
}{
  omitted
}

We can also show that

\mjdeqn{
  \left\langle AB\right\rangle_r=(-1)^{r(r-1)/2}\left\langle B^\dagger A^\dagger\right\rangle_r
}{
  omitted
}
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