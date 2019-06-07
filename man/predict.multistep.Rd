\name{predict.multistep}
\alias{predict.multistep}
\alias{*.multistep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Multidimensional step function evaluation}
\description{
  Evaluates a \code{multistep} type function at a given value
}
\usage{
\method{predict}{multistep}(object, newx, \dots)
\method{*}{multistep}(e1,e2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{A \code{multistep} object.}
  \item{newx}{Values to evaluate the represented function at. Each row is considered to be a separate observation.}
  \item{\dots}{Additional arguments for compatibility.}
  \item{e1}{Either a \code{multistep} object or a matrix to evaluate it at.}
  \item{e2}{Either a \code{multistep} object or a matrix to evaluate it at. One of e1, e2 must be a matrix, or vector.}
}
\value{
  Produces a vector of results.
%   ...
}
\author{Zhou Fang}
\note{ \code{predict(object, newx)} is equivalent to \code{object * newx}, which is also equivalent to \code{newx * object}. }

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\seealso{ \code{\link{multistep}} }
\examples{
## Produces a 2d step function

set.seed(79)
n <- 100; p <- 2

## Choose some random knots
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
obj = multistep(rep(0.1, (n-1)*p), x)
x2 <-  matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
predict(obj,x) - obj*x

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{models}
