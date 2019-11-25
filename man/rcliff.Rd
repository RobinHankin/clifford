\name{rcliff}
\alias{rcliff}
\title{Random clifford objects}
\description{Random Clifford algebra elements, intended as quick
  \dQuote{get you going} examples of \code{clifford} objects}
\usage{rcliff(n=9, b=6)}
\arguments{
  \item{n}{Number of terms}
  \item{b}{Maximum number of basis vectors in any blade}
}
\author{Robin K. S. Hankin}
\examples{
x1 <- rcliff()
x2 <- rcliff()
x3 <- rcliff()

x1*(x2*x3) == (x1*x2)*x3  # should be TRUE
}