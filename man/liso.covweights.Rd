\name{liso.covweights}
\alias{liso.covweights}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Covariate Weights for Adaptive Liso}
\description{
  Calculates covariate weights for the Adaptive Liso
}
\usage{
liso.covweights(obj, signfind = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{Initial fit to use, a \code{multistep} object.}
  \item{signfind}{If TRUE, conduct monotonicity detection procedure.}
}
\details{
This function calculates automatically weights for a second run of the Liso algorithm, in an adaptive liso scheme. See example for practical usage.
%  ~~ If necessary, more details than the description above ~~
}
\value{
  Produces a vector of covariate weights to be supplied as the \code{covweight} argument in liso.backfit.
%   ...
}
\references{Zhou Fang and Nicolai Meinshausen (2009),
  \emph{Liso for High Dimensional Additive Isotonic Regression}, available at
    \url{http://blah.com}}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\examples{
## Use the method on a simulated data set

set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## Adaptive liso
initialfit = liso.backfit(x,y, 4)
secondfit = liso.backfit(x,y, 4, covweights = liso.covweights(initialfit))

## Compare sparsity
which(dim(initialfit) != 0)
which(dim(secondfit) != 0)

set.seed(79)
y2 <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3-6*(abs(x[,2] - 1)< 0.1)  + rnorm(n)

## Sign finding
initialfit = liso.backfit(x,y2, 2, monotone=FALSE)
secondfit = liso.backfit(x,y2, 2, monotone=FALSE, covweights = liso.covweights(initialfit, signfind=TRUE))

## Compare monotonicity. Note near x=1
plot(secondfit, dim=2)
plot(initialfit, dim=2, add=TRUE, col=2)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
