\name{rcliff}
\alias{rcliff}
\title{Random clifford objects}
\description{Random Clifford algebra elements, intended as quick
  \dQuote{get you going} examples of \code{clifford} objects}
\usage{rcliff(n=9,d=6,r=4,include.fewer=FALSE)}
\arguments{
  \item{n}{Number of terms}
  \item{d}{Dimensionality of Clifford algebra}
  \item{r}{Maximum number of basis vectors in any blade}
  \item{include.fewer}{Boolean, with default \code{FALSE} meaning to
    return a clifford object with exactly \code{r} basis vectors in each
    blade, and \code{TRUE} meaning to include blades with fewer than
    \code{r} basis vectors}
}
\author{Robin K. S. Hankin}
\examples{

rcliff()
rcliff(d=3,r=2)
rcliff(3,10,7)
rcliff(3,10,7,include=TRUE)

x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE



}