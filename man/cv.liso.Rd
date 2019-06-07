\name{cv.liso}
\alias{cv.liso}
\alias{plotCV}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Liso Crossvalidation}
\description{
  Applies crossvalidation to Liso
}
\usage{
cv.liso(x, y, K = 10, lambda = NULL, trace = FALSE, plot.it = FALSE, se = TRUE, weights = rep(1, length(y)), weightedcv = FALSE, huber = Inf, covweights = rep(1, ncol(x)), gridsize = 50, gridmin = 0.01, \dots)
plotCV(cv.object, se=TRUE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
For cv.liso:
  \item{x}{Design matrix (without intercept).}
  \item{y}{Response value.}
  \item{K}{Number of CV folds.}
  \item{lambda}{Values of the penalty parameter lambda to be tried. For speed, it's advised that a decreasing vector be used. If NULL, a log grid used, using \code{liso.maxlamb} to calculate the maximum.} 
  \item{trace}{If TRUE, print diagnostic information as calculation is done.}
  \item{plot.it}{If TRUE, plot a graph of CV error against lambda with \code{plotCV}.}
  \item{weights}{Observation weights. Should be a vector of length equal to the number of observations.} 
  \item{weightedcv}{If TRUE, use observation weights when averaging CV error across folds.}
  \item{huber}{If less than Inf, huberisation parameter for huberised liso. (Experimental)}
  \item{covweights}{Covariate weights. Should be a vector of length equal to the number of covariates.}
  \item{gridsize}{Size of logarithmic grid of lambda values, if lambda is unspecified.}
  \item{gridmin}{Minimum of logarithmic grid of lambda values, if lambda is unspecified. Considered as a proportion of the maximum value of lambda.}
For plotCV:
  \item{cv.object}{Object to be plotted.}
For both:
  \item{se}{If TRUE, add error bars to CV plot.} 
  \item{\dots}{Additional arguments to be passed to \code{liso.backfit} or \code{plot}}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  cv.liso creates a list of 5 components:
  \item{lambda}{Lambda values used.}
  \item{cv}{Mean or weighted mean CV for each lambda.}
  \item{cv.error}{Sqrt of MLE estimated variance of CV for each lambda.}
  \item{residmat}{Full length(lambda) x K matrix of CV errors.}
  \item{optimlam}{Lambda value that minimises CV error}
%   ...
}
\references{Zhou Fang and Nicolai Meinshausen (2009),
  \emph{Liso for High Dimensional Additive Isotonic Regression}, available at
    \url{http://blah.com}}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\seealso{ \code{\link{liso.backfit}}  }
\examples{
## Use the method on a simulated data set

set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## Do CV
CVobj <- cv.liso(x,y, K=10, plot.it=TRUE)

## Do the actual fit
fitobj <- liso.backfit(x,y,CVobj$optimlam)
plot(fitobj)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
