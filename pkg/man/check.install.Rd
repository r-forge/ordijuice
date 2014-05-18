\name{check.install}
\alias{check.install}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
check.install
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
check.install(display.spider)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{display.spider}{
%%     ~~Describe \code{display.spider} here~~
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
function (display.spider)
{
## check for correct installation of all libraries
if (!all (c('vegan', 'mgcv', 'ordijuice', 'tcltk', 'tkrgl', 'rgl') \%in\% .packages(all = T)))
  {
  answ <- winDialog.m ('yesnocancel', 'Some of the R libraries were not installed correctly! \nDo you want to re-install them now? \n(you need to be connected to internet)')
  if (answ == 'YES') install.libraries ('all')
  }

## checks for the version of JUICE and asks for update if it's old
if (is.null (display.spider)) winDialog.m ('ok', 'To get full functionality, you need to install newer version of JUICE!')

## check for the version of R and ask for update if it's old
Rver <- getRversion ()
if (Rver < '2.8.1') winDialog.m ('ok', paste('Currently you are using ', Rver, ' version of R. To ensure the full functionality, please update to version 2.8.1 or newer!', sep = ''))
Rver >= '2.8.1'
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
