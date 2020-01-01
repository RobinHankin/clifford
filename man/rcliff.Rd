\name{rcliff}
\alias{rcliff}
\alias{rblade}
\title{Random clifford objects}
\description{Random Clifford algebra elements, intended as quick
  \dQuote{get you going} examples of \code{clifford} objects}
\usage{
rcliff(n=9, d=6, grade=4, include.fewer=TRUE)
rblade(n=9, d=4, factors=FALSE)
}
\arguments{
  \item{n}{Number of terms}
  \item{d}{Grade of Clifford algebra}
  \item{grade}{Maximum grade of any term}
  \item{include.fewer}{Boolean, with \code{FALSE} meaning to
    return a clifford object with exactly \code{grade} basis vectors in
    each term, and default \code{TRUE} meaning to include terms with
    fewer than \code{r} basis vectors}
  \item{factors}{In function \code{rblade()} with default \code{FALSE}
    meaning to return a random blade and \code{TRUE} meaning to return a
    list of independent vectors (that may be multiplied to give a
    blade)}
}
\author{Robin K. S. Hankin}
\examples{

rcliff()
rcliff(d=3,grade=2)
rcliff(3,10,7)
rcliff(3,10,7,include=TRUE)

x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE


rblade()
rblade(factors=TRUE)
Reduce(`*`,rblade(factors=TRUE))

}