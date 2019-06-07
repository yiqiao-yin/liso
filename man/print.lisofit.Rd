\name{print.lisofit}
\alias{print.lisofit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Prints details for a liso fit}
\description{
  Prints information and diagnostic statistics for a particular Liso fit.
}
\usage{
\method{print}{lisofit}(x, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A \code{lisofit} object.}
  Dummy variables for compatibility:
  \item{\dots}{Unused.}
}
\details{
%  ~~ If necessary, more details than the description above ~~
  \code{print} prints, in this case, n, p, Lambda for the fit, and then for each non-zero fitted variable, stepwise and total variation complexity statistics, as well as the apparent monotonicity of the fit if it was not pre-specified. Finally some residual statistics are printed.

}
%\value{
%  
%  For 'max', 'min', 'abs', 'dim', a vector with length equal to the number of covariates.
%
%  For 'summary', a list containing 'max', 'min', 'totalvar', 'dim', each being a vector of length equal to the number of covariates.
%%   \item{comp1 }{Description of 'comp1'}
%%   \item{comp2 }{Description of 'comp2'}
%%   ...
%}
\references{Zhou Fang and Nicolai Meinshausen (2009),
  \emph{Liso for High Dimensional Additive Isotonic Regression}, available at
    \url{http://blah.com}}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\seealso{ \code{\link{multistep}}, \code{\link{summary.multistep}} }
\examples{
## Use the method on a simulated data set
set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## try lambda = 2
fits <- liso.backfit(x,y, 2)
print(fits)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}
