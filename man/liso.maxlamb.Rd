\name{liso.maxlamb}
\alias{liso.maxlamb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Liso maximum lambda}
\description{
  Calculates maximum value of lambda for which Liso gives a non-zero fit
}
\usage{
liso.maxlamb(x=NULL,y=NULL,monotone=TRUE, covweights=rep(1, ncol(x)), weights=rep(1, length(y)))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Design matrix (without intercept).}
  \item{y}{Response value.}
    \item{monotone}{Monotonicity pattern. Can be a single value, or a vector of length equal to the number of covariates. Takes values -1, 0, 1, indicating monotonically decreasing, non-monotonic, monotonically increasing respectively.}
   \item{covweights}{Covariate weights. Should be a vector of length equal to the number of covariates, or more if different weights are to be applied to positive and negative fits of non-monotone components.}
  \item{weights}{Observation weights. Should be a vector of length equal to the number of observations.} 
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%   ...
%}
\references{Zhou Fang and Nicolai Meinshausen (2009),
  \emph{Liso for High Dimensional Additive Isotonic Regression}, available at
    \url{http://blah.com}}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\seealso{ \code{\link{plotCV}} }
\examples{
## Use the method on a simulated data set

set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

liso.maxlamb(x,y)
liso.maxlamb(x,y,monotone = -1)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
