\name{use.last}
\alias{use.last}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
use.last
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
use.last(input.data, type.of.analysis, setting)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input.data}{
%%     ~~Describe \code{input.data} here~~
}
  \item{type.of.analysis}{
%%     ~~Describe \code{type.of.analysis} here~~
}
  \item{setting}{
%%     ~~Describe \code{setting} here~~
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
function (input.data, type.of.analysis, setting)
{
  use.last.result <- FALSE
  if(all(c(paste (type.of.analysis, '_lfa.r', sep = ''), paste (type.of.analysis, '_lfq.r', sep = '')) \%in\% dir ()))
    {
    try (load (paste (type.of.analysis, '_lfq.r', sep = '')))
    if (last.data.quick$type.of.analysis == type.of.analysis & all(last.data.quick$size.of.matrix == dim(input.data$spec.data)) & last.data.quick$setting[[1]] == setting[[1]]) 
      {
      try (load (paste (type.of.analysis, '_lfa.r', sep = '')))
      if (last.data$last.matrix.sum == sum(input.data$spec.data) & all(last.data$last.matrix.species == colnames (input.data$spec.data)) & all(last.data$last.matrix.sites == rownames (input.data$spec.data)))
        use.last.result <- TRUE
      }
    }
    
  if(use.last.result) 
    list (use.last.result = use.last.result, last.data.result = last.data$last.result) else
    list (use.last.result = use.last.result, last.data.result = NULL)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
