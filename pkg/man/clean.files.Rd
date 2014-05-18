\name{clean.files}
\alias{clean.files}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
clean.files
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
clean.files()
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
  files.to.delete <- c('JUICE2.txt.Rout', 'result.txt', 'ordi-result.txt', 'JUICE2.txt', 'sh_expo.txt', 'specdata.txt', 'dca_lfa.r', 'dca_lfq.r', 'pca_lfa.r', 'pca_lfq.r', 'nmds_lfa.r', 'nmds_lfq.r', 'updat.R', 'updtchck.r', 'clean.R') 
  deleted.files <- files.to.delete [files.to.delete \%in\% list.files ()]
  try (file.remove (deleted.files))

  del.dir1 <- list.files (pattern = '2D_figures_')
  try (unlink (del.dir1, recursive = T))
  del.dir2 <- list.files (pattern = '3D_snapshots_')
  try (unlink (del.dir2, recursive = T))
  if (length (deleted.files) > 0 || length (del.dir1) > 0 || length (del.dir2) > 0)
    winDialog.m ('ok', message = paste(c('These items have been deleted: \n\n files:\n', deleted.files, '\n\ndirectories:\n', c (del.dir1, del.dir2)), sep = '', collapse = ' '))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
