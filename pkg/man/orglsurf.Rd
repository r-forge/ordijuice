\name{orglsurf}
\alias{orglsurf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
orglsurf
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
orglsurf(x, y, choices = c(1, 2, 3), knots = 10, family = "gaussian", col = "red", thinplate = TRUE, add = FALSE, display = "sites", w = weights(x), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{choices}{
%%     ~~Describe \code{choices} here~~
}
  \item{knots}{
%%     ~~Describe \code{knots} here~~
}
  \item{family}{
%%     ~~Describe \code{family} here~~
}
  \item{col}{
%%     ~~Describe \code{col} here~~
}
  \item{thinplate}{
%%     ~~Describe \code{thinplate} here~~
}
  \item{add}{
%%     ~~Describe \code{add} here~~
}
  \item{display}{
%%     ~~Describe \code{display} here~~
}
  \item{w}{
%%     ~~Describe \code{w} here~~
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
function (x, y, choices = c(1,2,3), knots = 10, family = 'gaussian', col = 'red', thinplate = TRUE, add = FALSE, display = "sites", 
    w = weights(x), ...) 
    {
    require (geometry, quietly = T)
    GRID = 30
    w <- eval(w)
    if (!is.null(w) && length(w) == 1) 
        w <- NULL
    if (!require(mgcv)) 
        stop("Requires package `mgcv'")
    X <- scores(x, choices = choices, display = display)
    x1 <- X[, 1]
    x2 <- X[, 2]
    x3 <- X[, 3]
    if (thinplate) 
        mod <- gam(y ~ s(x1, x2, x3, k = knots), family = family, weights = w) else 
          mod <- gam(y ~ s(x1, k = knots) + s(x2, k = knots) + s(x3, k = knots), family = family, weights = w)
    xn1 <- seq(min(x1), max(x1), len = GRID)
    xn2 <- seq(min(x2), max(x2), len = GRID)
    xn3 <- seq(min(x3), max(x3), len = GRID)
    newd <- expand.grid(x1 = xn1, x2 = xn2, x3 = xn3)
    fit <- predict(mod, type = "response", newdata = as.data.frame(newd))

    isinside <- rep (T, nrow (newd))
    convexhulls <- convhulln (X)
    for (ro in seq (1, nrow (convexhulls)))
      {
      bas.matrix <- X[convexhulls[ro,],]
      D <- det (bas.matrix)
      d <- 1
      bas.matrix.a <- bas.matrix
      bas.matrix.a[,1] <- 1
      a <- -d/D*det (bas.matrix.a)
      
      bas.matrix.b <- bas.matrix
      bas.matrix.b[,2] <- 1
      b <- -d/D*det (bas.matrix.b)
      
      bas.matrix.c <- bas.matrix
      bas.matrix.c[,3] <- 1
      c <- -d/D*det (bas.matrix.c)
      kolik <- a*newd[,1]+b*newd[,2]+c*newd[,3] + d      
      isinside[kolik < 0] <- F
      }
if (!add) ordirgl (x) 
fit.isinside <- fit[isinside]
rescale.fit.isinside <-  abs(fit.isinside-min(fit.isinside)) /  diff (range (fit.isinside)) *100
rgl.sprites (newd[isinside,], col = heat.colors (100)[ceiling(rescale.fit.isinside)],  lit=FALSE, alpha=.05, textype="alpha", texture=system.file("textures/particle.png", package="rgl") )
return (mod)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
