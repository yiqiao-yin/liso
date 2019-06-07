\name{summary.multistep}
\alias{summary.multistep}
\alias{max.multistep}
\alias{min.multistep}
\alias{dim.multistep}
\alias{abs.multistep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summary statistics for multistep objects}
\description{
  Calculates a variety of summary statistics for \code{multistep} (multidimensional step function) objects.
}
\usage{
\method{max}{multistep}(x, \dots, na.rm)
\method{min}{multistep}(x, \dots, na.rm)
\method{dim}{multistep}(x)
\method{abs}{multistep}(x)
\method{summary}{multistep}(object, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A \code{multistep} object.}
  \item{object}{A \code{multistep} object.}
  Dummy variables for compatibility:
  \item{\dots}{Unused.}
  \item{na.rm}{Unused.}
}
\details{
%  ~~ If necessary, more details than the description above ~~
  'max' and 'min' returns the maximum or minimum respectively of each covariate component.

  'dim' returns the number of non-zero steps in each covariate component.

  'abs' returns the total variation of each covariate component.

  'summary' returns a list containing all of the above.
}
\value{
  
  For 'max', 'min', 'abs', 'dim', a vector with length equal to the number of covariates.

  For 'summary', a list containing 'max', 'min', 'totalvar', 'dim', each being a vector of length equal to the number of covariates.
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
\seealso{ \code{\link{multistep}} }
\examples{
## Use the method on a simulated data set
set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## try lambda = 2
fits <- liso.backfit(x,y, 2)

## Plot some diagnostics
plot(max(fits))
plot(min(fits))
plot(abs(fits))
plot(dim(fits))
print(summary(fits))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}
