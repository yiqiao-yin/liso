\name{multistep}
\alias{multistep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Multidimensional step functions}
\description{
  Produces a \code{multistep} object
}
\usage{
multistep(coefchain,x=NULL,intercept=0,sortedx = apply(x,2,sort),names = NULL, pinters=NULL,\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{coefchain}{Vector of step sizes at each observation point for each vector, concatentated as a single vector.}
  \item{x}{Matrix of observations coefchain corresponds to.}
  \item{intercept}{Intercept value. i.e. value of mean(f(x)).}
  \item{sortedx}{x sorted in each column.}
  \item{names}{Names to be assigned to covariates.}
  \item{pinters}{The values of the component functions at the left ends of each range.}
  \item{\dots}{Additional variables to be stored in the final object.}
}
\details{
This function generates a \code{multistep} object, to represent a function that is the sum of right-continuous step functions on each input. Internally, the function is stored in a sparse format.

sortedx and pinters are calculated, if not provided.

Multistep objects may be plotted. They may also be evaluated at a particular vector value, or matrix of values, through the * operator or the predict function.
%  ~~ If necessary, more details than the description above ~~
}
\value{
  Produces a \code{multistep} object.
%   ...
}
\author{Zhou Fang}
% \note{ ~~further notes~~ 
\seealso{ \code{\link{plot.multistep}},\code{\link{summary.multistep}},\code{\link{predict.multistep}} }

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\examples{
## Produces a 2d step function

set.seed(79)
n <- 100; p <- 2

## Pick some random knots
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
obj = multistep(rep(0.1, (n-1)*p), x)
x2 <-  matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
obj * x2 - obj*x
image( outer(-50:50/10, -50:50/10, function(x,y) obj*c(x,y)))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{models}
