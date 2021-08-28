\name{const}
\alias{const}
\alias{constant}
\alias{const<-}
\alias{const<-.clifford}
\alias{constant<-}
\alias{constant<-.clifford}
\alias{is.real}
\title{The constant term of a Clifford object}
\description{
Get and set the constant term of a clifford object.
}
\usage{
const(C,drop=TRUE)
is.real(C)
\method{const}{clifford}(x) <- value
}
\arguments{
  \item{C,x}{Clifford object}
  \item{value}{Replacement value}
  \item{drop}{Boolean, with default \code{TRUE} meaning to return the
    constant coerced to numeric, and \code{FALSE} meaning to return a
    (constant) Clifford object}
}
\details{

Extractor method for specific terms.  Function \code{const()} returns
the constant element of a Clifford object.  Note that \code{const(C)}
returns the same as \code{grade(C,0)}, but is faster.


The R idiom in \code{const<-()} is slightly awkward:

\preformatted{
> body(`const<-.clifford`)
{
  stopifnot(length(value) == 1)
  x <- x - const(x)
  return(x + value)
}
}

The reason that it is not simply \code{return(x-const(x)+value)} or
\code{return(x+value-const(x))} is to ensure numerical accuracy; see
examples.

}
\author{Robin K. S. Hankin}
\seealso{
  \code{\link{grade}},
  \code{\link{clifford}},
  \code{\link{getcoeffs}},
  \code{\link{is.zero}}
}
\examples{

X <- clifford(list(1,1:2,1:3,3:5),6:9)

X <- X+1e300

const(X) # should be 1e300

const(X) <- 0.6
const(X) # should be 0.6, no numerical error

# compare naive approach:

X <- clifford(list(1,1:2,1:3,3:5),6:9)+1e300
X+0.6-const(X)  # constant gets lost in the numerics

X <- clifford(list(1,1:2,1:3,3:5),6:9)+1e-300
X-const(X)+0.6  # answer correct by virtue of left-associativity


x <- 2+rcliff(d=3,g=3)
jj <- x*cliffconj(x)
is.real(jj*rev(jj))   # should be TRUE
}
