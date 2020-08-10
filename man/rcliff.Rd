\name{rcliff}
\alias{rcliff}
\alias{rblade}
\title{Random clifford objects}
\description{Random Clifford algebra elements, intended as quick
  \dQuote{get you going} examples of \code{clifford} objects}
\usage{
rcliff(n=9, d=6, g=4, include.fewer=TRUE)
rblade(d=7, g=3)
}
\arguments{
  \item{n}{Number of terms}
  \item{d}{Dimensionality of underlying vector space}
  \item{g}{Maximum grade of any term}
  \item{include.fewer}{Boolean, with \code{FALSE} meaning to
    return a clifford object comprising only terms of grade \code{g},
    and default \code{TRUE} meaning to include terms with
    grades less than \code{g}}
}
\details{\loadmathjax

  Function \code{rcliff()} gives a quick nontrivial Clifford object,
  typically with terms having a range of grades (see \file{grade.Rd});
  argument \code{include.fewer=FALSE} ensures that all terms are of the
  same grade.

  Function \code{rblade()} gives a Clifford object that is a
  \emph{blade} (see \file{term.Rd}).  It returns the wedge product of a
  number of 1-vectors, for example
  \mjeqn{\left(e_1+2e_2\right)\wedge\left(e_1+3e_5\right)}{(e1+2e2)^(e1+3e5)}.
  
  Perwass gives the following lemma:

  Given blades \mjeqn{A_{\langle r\rangle}, B_{\langle s\rangle},
    C_{\langle t\rangle}}{see PDF}, then

  \mjdeqn{
    \langle
    A_{\langle r\rangle}
    B_{\langle s\rangle}
    C_{\langle t\rangle}
    \rangle_0
    =
    \langle
    C_{\langle t\rangle}
    A_{\langle r\rangle}
    B_{\langle s\rangle}
    \rangle_0
  }{
    omitted; see PDF
  }

  In the proof he notes in an intermediate step that 

    \mjdeqn{
    \langle
    A_{\langle r\rangle}
    B_{\langle s\rangle}
    \rangle_t * 
    C_{\langle t\rangle}
    =
    C_{\langle t\rangle} * 
    \langle
    A_{\langle r\rangle}
    B_{\langle s\rangle}
    \rangle_t
    = 
    \langle
    C_{\langle t\rangle}
    A_{\langle r\rangle}
    B_{\langle s\rangle}
    \rangle_0.
  }{
    omitted; see PDF
  }

  Package idiom is shown in the examples.

}
\author{Robin K. S. Hankin}
\seealso{\code{\link{term}},\code{\link{grade}}}
\examples{

rcliff()
rcliff(d=3,g=2)
rcliff(3,10,7)
rcliff(3,10,7,include=TRUE)

x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE


rblade()

# We can invert blades easily:
a <- rblade()
ainv <- rev(a)/scalprod(a)

zap(a*ainv)  # 1 (to numerical precision)
zap(ainv*a)  # 1 (to numerical precision)

# Perwass 2009, lemma 3.9:


A <- rblade(d=9,g=4)  
B <- rblade(d=9,g=5)  
C <- rblade(d=9,g=6)  

grade(A*B*C,0)-grade(C*A*B,0)   # zero to numerical precision



# Intermediate step

x1 <- grade(A*B,3) \%star\% C
x2 <- C \%star\% grade(A*B,3)
x3 <- grade(C*A*B,0)

max(x1,x2,x3) - min(x1,x2,x3)   # zero to numerical precision

}