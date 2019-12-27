\name{rev}
\alias{rev.clifford}
\alias{rev}
\title{Reverse of a Clifford object}
\description{
The \dQuote{reverse} of a blade is simply the basis vectors written in
reverse order; this changes the sign of the blade if the number of basis
vectors is 2 or 3 (modulo 4).  Taking the reverse is a linear
operation.  Hestenes uses \eqn{A^\dag}{?} to denote the reverse of
\eqn{A} and we have

\deqn{
  \left(A^\dag\right)^\dag=A\qquad
  \left(AB\right)^\dag=B^\dag A^\dag\qquad
  \left(A+B\right)^\dag=A^\dag+B^\dag\qquad
  \left<A^\dag\right>=\left<A\right>
}{
  omitted
}

where \eqn{\left<A\right>}{<A>} is the grade operator; and it is easy to
prove that

\deqn{
  \left<A^\dag\right>_r=\left<A\right>^\dag_r=(-1)^{r(r-1)/2}\left<A\right>_r
}{
  omitted
}

We can also show that

\deqn{
  \left<AB\right>_r=(-1)^{r(r-1)/2}\left<B^\dag A^\dag\right>_r
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


A <- rcliff(include=TRUE)
B <- rcliff(include=TRUE)
rev(A*B) == rev(B) * rev(A)   # should be TRUE

}