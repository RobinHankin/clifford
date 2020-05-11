\name{quaternion}
\alias{quaternion}
\alias{quaternion_to_clifford}
\alias{clifford_to_quaternion}
\title{Quaternions using Clifford algebras}
\description{
  Functionality for converting quaternions to and from Clifford objects.
}
\usage{
quaternion_to_clifford(Q)
clifford_to_quaternion(C)
}
\arguments{
  \item{C}{Clifford object}
  \item{Q}{Quaternion}
}
\details{\loadmathjax
  
  Given a quaternion \mjeqn{a+bi+cj+dk}{a+bi+cj+dk}, one may identify
\mjeqn{i}{i} with \mjeqn{-e_{12}}{-e_12}, \mjeqn{j}{j} with
\mjeqn{-e_{13}}{-e_13}, and \mjeqn{k}{k} with \mjeqn{-e_{23}}{-e_23}
(the constant term is of course \mjeqn{e_0}{e_0}).

The functions documented here convert from quaternions to clifford
objects and vice-versa.

}
\author{Robin K. S. Hankin}
\examples{

x1 <- clifford(list(numeric(0),c(1,2),c(1,3),c(2,3)),1:4)
clifford_to_quaternion(x1)

# Following needs the onion package (it is discouraged to load both):
# library("onion")
# Q1 <- rquat(1)
# Q2 <- rquat(1)
# LHS <- clifford_to_quaternion(quaternion_to_clifford(Q1) * quaternion_to_clifford(Q2))
# RHS <- Q1*Q2  
# LHS - RHS # zero to numerical precision


}
