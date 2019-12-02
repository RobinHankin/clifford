\name{rcliff}
\alias{rcliff}
\title{Random clifford objects}
\description{Random Clifford algebra elements, intended as quick
  \dQuote{get you going} examples of \code{clifford} objects}
\usage{rcliff(n=9,d=6,grade=4,include.fewer=TRUE)}
\arguments{
  \item{n}{Number of terms}
  \item{d}{Dimensionality of Clifford algebra}
  \item{grade}{Maximum grade of any blade}
  \item{include.fewer}{Boolean, with \code{FALSE} meaning to
    return a clifford object with exactly \code{grade} basis vectors in
    each blade, and default \code{TRUE} meaning to include blades with
    fewer than \code{r} basis vectors}
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



}