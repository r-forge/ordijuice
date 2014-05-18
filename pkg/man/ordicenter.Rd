\name{ordicenter}
\alias{ordicenter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ordicenter
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ordicenter(ord, groups, display = "sites", w = weights(ord, display), show.groups, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ord}{
%%     ~~Describe \code{ord} here~~
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
  \item{show.groups}{
%%     ~~Describe \code{show.groups} here~~
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
function (ord, groups, display = "sites", w = weights(ord, display), 
    show.groups, ...) 
{
    weights.default <- function(object, ...) NULL
    pts <- scores(ord, display = display, ...)
    w <- eval(w)
    if (length(w) == 1) 
        w <- rep(1, nrow(pts))
    if (is.null(w)) 
        w <- rep(1, nrow(pts))
    if (!missing(show.groups)) 
        {
        take <- groups \%in\% show.groups
        pts <- pts[take, , drop = FALSE]
        groups <- groups[take]
        w <- w[take]
        }
    out <- seq(along = groups)
    inds <- names(table(groups))
    for (is in inds) 
      {
        gr <- out[groups == is]
        if (length(gr) > 1)
         {
            X <- pts[gr, ]
            W <- w[gr]
            ave <- apply(X, 2, weighted.mean, w = W)
            ordiArgAbsorber(ave[1], ave[2], labels = is, FUN = text, cex = 1.2, ...)
        }
        if (length(gr) == 1)
         {
            X <- pts[gr, ]
            W <- w[gr]
            ordiArgAbsorber(X[1], X[2], labels = is, FUN = text, cex = 1.2, ...)
        }
    }
    invisible()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
