\name{check.update}
\alias{check.update}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
check.update
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
check.update()
}
%- maybe also 'usage' for other objects documented here.
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
function ()
  {
  new.available <- FALSE
  last.checking <- NULL
  try(load ('updtchck.r'), silent = T)
  if (is.null (last.checking))
    {
        checking <- NULL
        try(checking <- old.packages ('../library', contriburl = 'http://sci.muni.cz/botany/zeleny/R/windows/contrib/R-2.8.1/'), silent = T)
        if (!is.null(checking)) if (checking[,5] > checking[,3]) new.available <- TRUE
        last.checking <- as.numeric(format (Sys.time(), "\%y\%m\%d\%H\%M\%OS1"))
        save (last.checking, file = 'updtchck.r')
     } else
      {
      if (as.numeric(format(Sys.time(), "\%y\%m\%d\%H\%M\%OS1"))-last.checking > 1000000)
        {
        checking <- NULL
        try(checking <- old.packages ('../library', contriburl = 'http://sci.muni.cz/botany/zeleny/R/windows/contrib/R-2.8.1/'))
        if (!is.null(checking)) if (checking[,5] > checking[,3]) new.available <- TRUE
        last.checking <- as.numeric(format (Sys.time(), "\%y\%m\%d\%H\%M\%OS1"))
        save (last.checking, file = 'updtchck.r')
        }
      }
  if (new.available) 
    {
    answ <- winDialog.m ('yesnocancel', 'New update of ORDIJUICE is available online. \nDo you want to update now?')
    if (answ == 'YES') install.libraries ('ordijuice')
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
