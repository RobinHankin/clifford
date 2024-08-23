\name{quaternion}
\alias{quaternion}
\alias{quaternion_to_clifford}
\alias{clifford_to_quaternion}
\title{Quaternions using Clifford algebras}
\description{
  Converting quaternions to and from Clifford objects is not part of the
  package but functionality and a short discussion is included in
  \code{inst/quaternion_clifford.Rmd}.

}
\details{
  
  Given a quaternion \eqn{a+bi+cj+dk}{a+bi+cj+dk}, one may identify
\eqn{i}{i} with \eqn{-e_{12}}{-e_12}, \eqn{j}{j} with
\eqn{-e_{13}}{-e_13}, and \eqn{k}{k} with \eqn{-e_{23}}{-e_23}
(the constant term is of course \eqn{e_0}{e_0}).

}
\author{Robin K. S. Hankin}
\note{
  A different mapping, from the quaternions to
  \eqn{\operatorname{Cl}(0,2)}{Cl(0,2)} is given at
  \code{signature.Rd}.
}
\seealso{\code{\link{signature}}}
