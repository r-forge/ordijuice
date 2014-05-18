\name{winDialog.m}
\alias{winDialog.m}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
winDialog.m
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
winDialog.m(type = c("ok", "okcancel", "yesno", "yesnocancel"), message)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{message}{
%%     ~~Describe \code{message} here~~
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
function (type = c("ok", "okcancel", "yesno", "yesnocancel"), message) 
{
# the change is in cancelling checking for interactive use of function
#    if (!interactive()) 
#        stop("winDialog() cannot be used non-interactively")
    type <- match.arg(type)
    res <- .Internal(winDialog(type, message))
    if (res == 10) 
        return(invisible(NULL))
    c("NO", "CANCEL", "YES", "OK")[res + 2]
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
