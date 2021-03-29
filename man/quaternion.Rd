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
\details{\loadmathjax
  
  Given a quaternion \mjeqn{a+bi+cj+dk}{a+bi+cj+dk}, one may identify
\mjeqn{i}{i} with \mjeqn{-e_{12}}{-e_12}, \mjeqn{j}{j} with
\mjeqn{-e_{13}}{-e_13}, and \mjeqn{k}{k} with \mjeqn{-e_{23}}{-e_23}
(the constant term is of course \mjeqn{e_0}{e_0}).

}
\author{Robin K. S. Hankin}
\note{
  A different mapping, from the quaternions to \mjseqn{Cl(0,2)} is
  given at \code{signature.Rd}.
}
\seealso{\code{\link{signature}}}
