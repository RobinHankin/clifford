\name{clifford-package}
\alias{clifford-package}
\docType{package}
\title{
\packageTitle{clifford}
}
\description{
\packageDescription{clifford}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{clifford}
\packageIndices{clifford}

}
\author{
\packageAuthor{clifford}

Maintainer: \packageMaintainer{clifford}
}
\keyword{ package }
\seealso{\code{\link{clifford}}}
\examples{

as.1vector(1:4)

as.1vector(1:4) * rcliff()

# Following from Ablamowicz and Fauser (see vignette):
x <- clifford(list(1:3,c(1,5,7,8,10)),c(4,-10)) + 2
y <- clifford(list(c(1,2,3,7),c(1,5,6,8),c(1,4,6,7)),c(4,1,-3)) - 1
x*y # signature irrelevant



}
