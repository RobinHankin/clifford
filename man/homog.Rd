\name{homog}
\alias{homog}
\alias{is.homog}
\alias{is.homogenous}
\alias{homogenous}
\title{Homogenous Clifford objects}
\description{

A clifford object is homogenous if all its blades are the same grade.  A
scalar (including the zero clifford object) is considered to be
homogenous, but it is not clear to me whether this is appropriate.

}
\usage{
is.homog(C)
}
\arguments{\item{C}{Object of class clifford}}
\details{
  Homogenous clifford objects have a multiplicative inverse.
}
\author{Robin K. S. Hankin}
\examples{
is.homog(rcliff())
is.homog(rcliff(include.fewer=FALSE))
}