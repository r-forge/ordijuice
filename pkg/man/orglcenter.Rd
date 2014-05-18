\name{orglcenter}
\alias{orglcenter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
orglcenter
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
orglcenter(object, groups, display = "sites", w = weights(object, display), choices = 1:3, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
%%     ~~Describe \code{object} here~~
}
  \item{groups}{
%%     ~~Describe \code{groups} here~~
}
  \item{display}{
%%     ~~Describe \code{display} here~~
}
  \item{w}{
%%     ~~Describe \code{w} here~~
}
  \item{choices}{
%%     ~~Describe \code{choices} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (object, groups, display = "sites", w = weights(object, 
    display), choices = 1:3, ...) 
{
    weights.default <- function(object, ...) NULL
    pts <- scores(object, display = display, choices = choices, ...)
    out <- seq(along = groups)
    w <- eval(w)
    if (length(w) == 1) w <- rep(1, nrow(pts))
    if (is.null(w)) w <- rep(1, nrow(pts))
    inds <- names(table(groups))
    shift <- 0.02 * diff (range (pts[,1]))
    for (is in inds) {
      gr <- out[groups == is]
      if (length(gr) > 1)
        {
        X <- pts[gr, ]
        W <- w[gr]
        ave <- apply(X, 2, weighted.mean, w = W)
        rgl.texts(ave[1]+shift, ave[2]+shift, ave[3]+shift, text = is, col = 'black', ...)
        }
      if (length (gr) == 1)
        {
        X <- pts[gr, ]
        rgl.texts (X+shift, text = is, col = 'black', ...)
        }
      }
  invisible()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
