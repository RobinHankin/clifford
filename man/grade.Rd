\name{grade}
\alias{grade}
\alias{grade<-}
\alias{grades}
\alias{gradesplus}
\alias{gradesminus}
\alias{gradeszero}
\alias{gradeplus}
\alias{grademinus}
\alias{gradezero}
\title{The grade of a clifford object}
\description{\loadmathjax
  The \dfn{grade} of a term is the number of basis vectors in it.}
\usage{
grade(C, n, drop=TRUE)
grade(C,n) <- value
grades(x)
gradesplus(x)
gradesminus(x)
gradeszero(x)
}
\arguments{
  \item{C,x}{Clifford object}
  \item{n}{Integer vector specifying grades to extract}
  \item{value}{Replacement value, a numeric vector}
  \item{drop}{Boolean, with default \code{TRUE} meaning to coerce a
    constant Clifford object to numeric, and \code{FALSE} meaning not
    to}
}
\details{

A \dfn{term} is a single expression in a Clifford object.  It has a
coefficient and is described by the basis vectors it comprises.  Thus
\mjeqn{4e_{234}}{4e_123} is a term but \mjseqn{e_3 + e_5} is not.
  
The \dfn{grade} of a term is the number of basis vectors in it.  Thus
the grade of \mjeqn{e_1}{e1} is 1, and the grade of
\mjeqn{e_{125}=e_1e_2e_5}{e_125=e1 e2 e5} is 3.  The grade operator
\mjeqn{\left\langle\cdot\right\rangle_r}{<.>_r} is used to extract terms
of a particular grade, with

\mjdeqn{
  A=\left\langle A\right\rangle_0 + 
    \left\langle A\right\rangle_1 + 
    \left\langle A\right\rangle_2 + \cdots = \sum_r\left\langle A\right\rangle_r
}{
  A = <A>_0 + <A>_1 + <A>_2 +... = sum <A>_r
}

for any Clifford object \eqn{A}.  Thus \mjeqn{\left\langle
A\right\rangle_r}{<A>_r} is said to be homogenous of grade \eqn{r}.
Hestenes sometimes writes subscripts that specify grades using an
overbar as in \mjeqn{\left\langle
A\right\rangle_{\overline{r}}}{omitted}.  It is conventional to denote
the zero-grade object \mjeqn{\left\langle A\right\rangle_0}{<A>_0} as
simply \mjeqn{\left\langle A\right\rangle}{<A>}.

We have

\mjdeqn{
\left\langle A+B\right\rangle_r=\left\langle A\right\rangle_r + \left\langle B\right\rangle_r\qquad
\left\langle\lambda A\right\rangle_r=\lambda\left\langle A\right\rangle_r\qquad
\left\langle\left\langle A\right\rangle_r\right\rangle_s=\left\langle A\right\rangle_r\delta_{rs}.
}{
  omitted; see PDF
}
  
Function \code{grades()} returns an (unordered) vector specifying the
grades of the constituent terms.  Function \code{grades<-()} allows
idiom such as \code{grade(x,1:2) <- 7} to operate as expected [here to
set all coefficients of terms with grades 1 or 2 to value 7].

Function \code{gradesplus()} returns the same but counting only basis
vectors that square to \eqn{+1}, and \code{gradesminus()} counts only
basis vectors that square to \eqn{-1}.  Function \code{signature()}
controls which basis vectors square to \eqn{+1} and which to \eqn{-1}.

From Perwass, page 57, given a bilinear form

\mjdeqn{\left\langle{\mathbf x},{\mathbf x}\right\rangle=x_1^2+x_2^2+\cdots
  +x_p^2-x_{p+1}^2-\cdots -x_{p+q}^2
}{
  <x,x>=x_1^2+...+x_p^2-x_{p+1}^2-...-x_{p+q}^2
}

and a basis blade \mjteqn{e_A}{e_\mathbb{A}}{e_A} with
\mjteqn{A\subseteq\left\lbrace
1,\ldots,p+q\right\rbrace}{\mathbb{A}\subseteq\left\lbrace
1,\ldots,p+q\right\rbrace}{omitted}, then

\mjtdeqn{
  \mathrm{gr}(e_A) = \left|\left\lbrace a\in A\colon
  1\leq a\leq p+q\right\rbrace\right|
}{
  \mathrm{gr}(e_\mathbb{A}) = \left|\left\lbrace a\in\mathbb{A}\colon
  1\leq a\leq p+q\right\rbrace\right|
}{
  omitted
}

\mjtdeqn{
  \mathrm{gr}_{+}(e_A) = \left|\left\lbrace a\in A\colon
  1\leq a\leq p\right\rbrace\right|
}{
  \mathrm{gr}_{+}(e_\mathbb{A}) = \left|\left\lbrace a\in\mathbb{A}\colon
  1\leq a\leq p\right\rbrace\right|
}{
  omitted
}
    
\mjtdeqn{
  \mathrm{gr}_{-}(e_A) = \left|\left\lbrace a\in A\colon
  p < a\leq p+q\right\rbrace\right|
}{
  \mathrm{gr}_{-}(e_\mathbb{A}) = \left|\left\lbrace a\in\mathbb{A}\colon
  p < a\leq p+q\right\rbrace\right|
}{
  omitted
}

Function \code{gradeszero()} counts only the basis vectors squaring to
zero (I have not seen this anywhere else, but it is a logical
suggestion).

If the signature is zero, then the Clifford algebra reduces to a
Grassman algebra and products match the wedge product of exterior
calculus.  In this case, functions \code{gradesplus()} and
\code{gradesminus()} return \code{NA}.

Function \code{grade(C,n)} returns a clifford object with just the
elements of grade \code{g}, where \code{g \%in\% n}.

The zero grade term, \code{grade(C,0)}, is given more naturally by
\code{const(C)}.

Function \code{c_grade()} is a helper function that is documented at
\code{Ops.clifford.Rd}.

}
\author{Robin K. S. Hankin}
\note{
  In the C code, \dQuote{term} has a slightly different meaning,
  referring to the vectors without the associated coefficient.
}
\seealso{\code{\link{signature}}, \code{\link{const}}}
\references{C. Perwass 2009. \dQuote{Geometric algebra with applications
    in engineering}.  Springer.
  }
\examples{

a <- clifford(sapply(seq_len(7),seq_len),seq_len(7))
a
grades(a)
grade(a,5)


signature(2,2)
x <- rcliff()
drop(gradesplus(x) + gradesminus(x) + gradeszero(x) - grades(x))

a <- rcliff()
a == Reduce(`+`,sapply(unique(grades(a)),function(g){grade(a,g)}))

}
