\name{liso.backfit}
\alias{liso.backfit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to fit penalized additive isotonic models}
\description{
  Fits penalized additive isotonic models using a total variation penalty.
}
\usage{
liso.backfit(x, y, lambda=0, givebeta = FALSE, tol.target = 1e-04, weights= rep(1, length(y)), covweights=rep(1, ncol(x)), feed, trace=FALSE, monotone=TRUE, randomise=FALSE, huber=Inf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Design matrix (without intercept).}
  \item{y}{Response value.}
  \item{lambda}{Value of the penalty parameter lambda. Can be either a single value or a vector, in which case the calculations are done sequentially, using the previous calculation as the \code{feed} input.} 
  \item{givebeta}{If TRUE, output result as a vector instead of a \code{multistep} object.} 
  \item{tol.target}{Threshold at which Liso loss change is considered small enough for convergence.} 
  \item{weights}{Observation weights. Should be a vector of length equal to the number of observations.} 
  \item{covweights}{Covariate weights. Should be a vector of length equal to the number of covariates, or more if different weights are to be applied to positive and negative fits of non-monotone components.}
  \item{feed}{Initial values for backfitting calculation. By default, the zero fit is used. Any \code{multistep} fit can be used instead.}
  \item{trace}{If TRUE, print diagnostic information as calculation is done.}
  \item{monotone}{Monotonicity pattern. Can be a single value, or a vector of length equal to the number of covariates. Takes values -1, 0, 1, indicating monotonically decreasing, non-monotonic, monotonically increasing respectively.}
  \item{randomise}{If TRUE, randomly permute the order of backfitting in each cycle. Usually slower, but possibly more stable.}
  \item{huber}{If less than Inf, huberization parameter for huberized liso. (Experimental)}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  With a single value of \code{lambda}, a \code{lisofit} object is returned, which inherits from class \code{multistep}. With more than one value, a list of \code{lisofit} values are generated. \code{plot}, \code{summary}, \code{print}, \code{`*`} and other methods exist. 
%   \item{comp1 }{Description of 'comp1'}
%   \item{comp2 }{Description of 'comp2'}
%   ...
}
\references{Zhou Fang and Nicolai Meinshausen (2009),
  \emph{Liso for High Dimensional Additive Isotonic Regression}, available at
    \url{http://blah.com}}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\seealso{ \code{\link{cv.liso}} }
\examples{
## Use the method on a simulated data set

set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]< 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## Try lambda = 2, lambda = 1
fits <- liso.backfit(x,y, c(2,1), monotone=c(-1,rep(1, 49)))

## plot the result for lambda = 2
plot(fits[[2]])

## Plot y-yhat plot
plot(y,fits[[2]] * x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}
