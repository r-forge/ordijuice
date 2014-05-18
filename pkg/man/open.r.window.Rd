\name{open.r.window}
\alias{open.r.window}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
open.r.window
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
open.r.window(three.dim, resolution)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{three.dim}{
%%     ~~Describe \code{three.dim} here~~
}
  \item{resolution}{
%%     ~~Describe \code{resolution} here~~
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
function (three.dim, resolution)
{
  if (!three.dim)
  {
    windows (xpos = 300, ypos = 10)
    plot.new()
    text (.5,.5, '..................', cex = 3, col = 'red')
    bringToTop (dev.cur(), stay = F)
  } else
  {
    library (rgl)    
    open3d()
    par3d (windowRect = c (300, 100, resolution[1]-100, resolution[2]-100), userMatrix =  matrix (c(1,0,0,0,0,0.9659258, -0.2588190, 0, 0, 0.2588190, 0.9659258, 0, 0, 0, 0, 1), ncol  = 4, byrow = T))
    rgl.points (seq(-5,5, len = 50),0,0, col = 'red', cex = 4)
    rgl.bringtotop (stay = F)
  }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
