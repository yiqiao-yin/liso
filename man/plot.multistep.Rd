\name{plot.multistep}
\alias{plot.multistep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot a multidimensional step function}
\description{
  Produces covariate plots for a multidimensional step function.
}
\usage{
\method{plot}{multistep}(x = NULL, xpoints=NULL, ypoints = NULL, dims = 1:max(nrow(x$param), ncol(xpoints)) , ylimit = cbind(min(min(x),max(x)), max(max(x), min(x))), grid = TRUE, add = FALSE, titles = !add,\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A \code{multistep} object.}
  \item{xpoints}{Covariate values of additional points to be plotted.}
  \item{ypoints}{Response values of additional points to be plotted.}
  \item{dims}{Dimensions to be shown. (Default is all)}
  \item{ylimit}{Y-axis limits to be used for all plots.}
  \item{grid}{If TRUE, construct a grid of plots to show all plotted components. Otherwise, plot each component after the other normally.}
  \item{add}{If TRUE, superimpose new plot on the old plot. This may false for more than one component.}
  \item{titles}{If TRUE, add names of covariates to plot.}
  \item{\dots}{Additional arguments to be passed to plot.}
}
\value{
  If \code{grid} is TRUE, return the old par() values before function was called.
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
\seealso{ \code{\link{multistep}}, \code{\link{plot}}}
\examples{
## Use the method on a simulated data set
set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## try lambda = 2
fits <- liso.backfit(x,y, 2)
fits2 <- liso.backfit(x,y, 4)

## Plot in some different ways
plot(fits, dim=2)
plot(fits2, dim=2, col=2, add=TRUE)

plot(fits, grid=FALSE)
plot(fits)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
