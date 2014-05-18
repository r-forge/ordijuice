\name{ordirgl.m}
\alias{ordirgl.m}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ordirgl.m
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ordirgl.m(object, display = "sites", choices = 1:3, type = "p", ax.col = "red", arr.col = "yellow", text, envfit.m, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
%%     ~~Describe \code{object} here~~
}
  \item{display}{
%%     ~~Describe \code{display} here~~
}
  \item{choices}{
%%     ~~Describe \code{choices} here~~
}
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{ax.col}{
%%     ~~Describe \code{ax.col} here~~
}
  \item{arr.col}{
%%     ~~Describe \code{arr.col} here~~
}
  \item{text}{
%%     ~~Describe \code{text} here~~
}
  \item{envfit.m}{
%%     ~~Describe \code{envfit.m} here~~
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
function (object, display = "sites", choices = 1:3, type = "p", ax.col = "red", arr.col = "yellow", text, envfit.m, ...) 
{
    if (!require(rgl)) 
        stop("Requires package 'rgl'")
    x <- scores(object, display = display, choices = choices, 
        ...)
    if (ncol(x) < 3) 
        stop("3D display needs three dimensions...")
    if (type == "p") 
        points3d(x[, 1], x[, 2], x[, 3], ...)
    else if (type == "t") {
        if (missing(text)) 
            text <- rownames(x)
        texts3d(x[, 1], x[, 2], x[, 3], text, justify = "center", 
            ...)
    }
    lines3d(range(x[, 1]), c(0, 0), c(0, 0), col = ax.col)
    lines3d(c(0, 0), range(x[, 2]), c(0, 0), col = ax.col)
    lines3d(c(0, 0), c(0, 0), range(x[, 3]), col = ax.col)
    texts3d(1.1 * max(x[, 1]), 0, 0, colnames(x)[1], col = ax.col, adj = 0.5)
    texts3d(0, 1.1 * max(x[, 2]), 0, colnames(x)[2], col = ax.col, adj = 0.5)
    texts3d(0, 0, 1.1 * max(x[, 3]), colnames(x)[3], col = ax.col, adj = 0.5)
    if (!missing(envfit.m)) {
      for (column in seq (1, dim (as.matrix(envfit.m))[2]))
      {
       object.fit <- envfit (object, envfit.m[,column, drop = F], choices = 1:4)
       bp <- scores(object.fit, dis = "bp", choices = choices)
       cn <- scores(object.fit, dis = "cn", choices = choices)
       if (!is.null(cn) && !any(is.na(cn))) {
            bp <- bp[!(rownames(bp) \%in\% rownames(cn)), , drop = FALSE]
            texts3d(cn[, 1], cn[, 2], cn[, 3], rownames(cn), 
                col = arr.col[column], adj = 0.5)
            points3d(cn[, 1], cn[, 2], cn[, 3], size = 5, col = arr.col[column])
        }
        if (!is.null(bp) && nrow(bp) > 0) {
            mul <- c(range(x[, 1]), range(x[, 2]), range(x[, 
                3]))/c(range(bp[, 1]), range(bp[, 2]), range(bp[, 
                3]))
            mul <- mul[is.finite(mul) & mul > 0]
            mul <- min(mul)
            bp <- bp * mul
            for (i in 1:nrow(bp)) {
                lines3d(c(0, bp[i, 1]), c(0, bp[i, 2]), c(0, 
                  bp[i, 3]), col = arr.col [column])
                texts3d(1.1 * bp[i, 1], 1.1 * bp[i, 2], 1.1 * 
                  bp[i, 3], rownames(bp)[i], col = arr.col[column], adj = 0.5)
            }
        }
      }  
    }
    invisible()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
