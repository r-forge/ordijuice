\name{orglhull}
\alias{orglhull}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
orglhull
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
orglhull(object, groups, display = "sites", choices = 1:3, show.groups = NULL, ...)
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
  \item{choices}{
%%     ~~Describe \code{choices} here~~
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
function (object, groups, display = 'sites', choices = 1:3, show.groups = NULL,  ...)
{
require (geometry, quietly = T)
pts <- scores (object, choices = choices, display = display, ...)
if (!is.null(show.groups))
{take <- groups \%in\% show.groups
  pts <- pts[take, , drop = FALSE]
  groups <- groups[take]}
out <- seq (along = groups)
inds <- names (table (groups))
for (is in inds)
  {
  gr <- out[groups == is]
  if (length (gr) == 2)
    {
    X <- pts[gr,]
    rgl.lines (X[,1], X[,2], X[,3], lwd = 2, ...)
    }

  if (length (gr) == 3)
    {
    X <- pts[gr,]
    rgl.triangles (X[,1], X[,2], X[,3], ...)  
    }
  if (length (gr) > 3)
    {
    X <- pts[gr,]
    # check if the points are not situated in hyperplane
      bas.matrix <- X[1:3,]
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
      kolik <- a*X[,1]+b*X[,2]+c*X[,3] + d      
      save (X, file = 'X.r')
      if (all (abs (kolik) <=  1e-10)) X <- X + runif (length (X), min = -1e-5, max = 1e-5)

    tr <-  t (convhulln (X))
    print (tr)
    rgl.triangles (X[tr,1], X[tr,2], X[tr,3], ...)
    }
   }
   invisible ()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
