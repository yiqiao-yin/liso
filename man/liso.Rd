\name{liso}
\alias{liso}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Automatically conducts Liso fits}
\description{
  An automatic CV and fitting wrapper for Liso.
}
\usage{
liso(x, y, adaptive = TRUE, lambda = NULL, monotone = NULL, control=list(cv = NULL, liso = NULL ))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Design matrix (without intercept).}
  \item{y}{Response value.}
  \item{adaptive}{If TRUE, conduct an adaptive liso type procedure. Otherwise just do the raw liso fits.}
  \item{lambda}{Value of the penalty parameter lambda. Default is NULL, specifying repeated cross-validations. Can be a vector, in which case each term gives the lambda for each step of the adaptive procedure.}
  \item{monotone}{Monotonicity pattern. Default is NULL, specifying a sign-discovery procedure, or non-monotone fitting if \code{adaptive} is FALSE.}
  \item{control}{Optional additional arguments to be passed to the cross-validation or backfitting, as a two field list. Each of \code{control$cv}, \code{control$liso} should be themselves a list, to be passed on as arguments to the relevant part of the procedure.}
}
\details{
%  ~~ If necessary, more details than the description above ~~
 This function is a convenient wrapper for the liso functions that automates the process of CV and fitting or adaptive fitting. 
}
\value{
  A \code{lisofit} object is returned to represent the fit, which inherits from class \code{multistep}. \code{plot}, \code{summary}, \code{print}, \code{`*`} and other methods exist. 

}
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
\seealso{ \code{\link{liso.backfit}}, \code{\link{cv.liso}} }
\examples{
## Use the method on a simulated data set
set.seed(79)
n <- 100; p <- 50

## Simulate design matrix and response
x <- matrix(runif(n * p, min = -2.5, max = 2.5), nrow = n, ncol = p)
y <- scale(3 * (x[,1]> 0), scale=FALSE)  + x[,2]^3 + rnorm(n)

## Do a single prespecified fit 
fit1 = liso(x,y, FALSE, 4, TRUE)
plot(fit1, dims=1:2)

## Do a cross-validated fit constrained to be monotone increasing
fit2 = liso(x,y, FALSE, monotone=TRUE)
plot(fit2, dims=1:2)

## Do an adaptive fit constrained to be monotone increasing, with an increased tolerance for convergence in the crossvalidation
fit3 = liso(x,y, TRUE, monotone=TRUE, control=list(cv=list(tol.target=1e-2), liso=NULL))
plot(fit3, dims=1:2)

## Do a sign discovery adaptive fit, with 5 CV folds instead of 10
fit4 = liso(x,y, TRUE, control=list(cv=list(K=5), liso=NULL))
plot(fit4, dims=1:2)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}
