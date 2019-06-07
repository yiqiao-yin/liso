\name{seq.log}
\alias{seq.log}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Log grid seq}
\description{
  Generates a log grid
}
\usage{
seq.log(from = 1, to = 1, length.out = 50, add.zero = FALSE, shifting = 0, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{from}{First value.}
  \item{to}{Final value.}
  \item{length.out}{Number of values to generate.}
  \item{add.zero}{If TRUE, append the value 0 on the smaller end of the result.} 
  \item{shifting}{Shifting to apply to the log grid. Negative values produce greater bunching up near the minimum, with the reverse for positive values. NOTE: \code{shifting + from} and \code{shifting + to} must both be greater than zero.}
  \item{\dots}{Dummy variables for compatibility}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  A vector of length length.out, plus one if add.zero is TRUE.
%   ...
}
\author{Zhou Fang}
% \note{ ~~further notes~~ 

%  ~Make other sections like Warning with \section{Warning }{....} ~
% }
\examples{
seq.log(1,10, 10)
seq.log(1,10, 10, FALSE, -0.9)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
