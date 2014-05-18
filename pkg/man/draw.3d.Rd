\name{draw.3d}
\alias{draw.3d}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
draw.3d
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
draw.3d(input.data, spec.data.ord, display.in.diagram, display.species, display.sites, axes.shown, display.EIV, display.header, display.envelope, header.name, display.header.style, display.spider, display.group.center, pb)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input.data}{
%%     ~~Describe \code{input.data} here~~
}
  \item{spec.data.ord}{
%%     ~~Describe \code{spec.data.ord} here~~
}
  \item{display.in.diagram}{
%%     ~~Describe \code{display.in.diagram} here~~
}
  \item{display.species}{
%%     ~~Describe \code{display.species} here~~
}
  \item{display.sites}{
%%     ~~Describe \code{display.sites} here~~
}
  \item{axes.shown}{
%%     ~~Describe \code{axes.shown} here~~
}
  \item{display.EIV}{
%%     ~~Describe \code{display.EIV} here~~
}
  \item{display.header}{
%%     ~~Describe \code{display.header} here~~
}
  \item{display.envelope}{
%%     ~~Describe \code{display.envelope} here~~
}
  \item{header.name}{
%%     ~~Describe \code{header.name} here~~
}
  \item{display.header.style}{
%%     ~~Describe \code{display.header.style} here~~
}
  \item{display.spider}{
%%     ~~Describe \code{display.spider} here~~
}
  \item{display.group.center}{
%%     ~~Describe \code{display.group.center} here~~
}
  \item{pb}{
%%     ~~Describe \code{pb} here~~
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
function (input.data, spec.data.ord, display.in.diagram, display.species, display.sites, axes.shown, display.EIV, display.header, display.envelope, header.name, display.header.style, display.spider, display.group.center, pb)
{

### writes warnings
  if (length (input.data$title.warnings) > 0) write.warnings (input.data$title.warnings)
  
### plots the basic plot with EIV, short header and long header  
  rgl.pop()
  sk <- scores (spec.data.ord, choices = axes.shown, display = 'sites')
  sk.sp <- scores (spec.data.ord, choices = axes.shown, display = 'species')
  what.to.display <- if (display.in.diagram == 'none' || display.in.diagram == 'sites') 'sites' else 'species'
  display.long.header <- input.data$display.long.header

  if (display.EIV | (display.header & display.header.style == 'arrow') | display.long.header) 
   {
    arr.col <- NULL
    env.data <- NULL

    if (display.EIV)
    {
      if (sum(colSums(input.data$ellenb))!=0)
      {
        arr.col <- append (arr.col, rep ('navy', 6))
        if (is.null (env.data)) env.data <- input.data$ellenb else env.data <- cbind (env.data, as.matrix(input.data$ellenb))      
      }
    }
    if (display.header & display.header.style == 'arrow') 
    {
      arr.col <- append (arr.col, 'seagreen')
      temp.short.header <- input.data$short.header.file[, 'factor', drop = F]
      names (temp.short.header) <- header.name
      if (is.null (env.data)) env.data <- temp.short.header else env.data <- cbind (env.data, temp.short.header)      
    }
    if (display.long.header)
    {
      arr.col <- append (arr.col, rep ('blue', dim (input.data$long.header.file)[2]))
      if (is.null (env.data)) env.data <- input.data$long.header.file else env.data <- cbind (env.data, input.data$long.header.file)
    }
    ordirgl.m (spec.data.ord, choices = axes.shown, display = what.to.display, type = 'n', envfit.m = env.data, arr.col = arr.col)
  } else  ordirgl.m (spec.data.ord, choices = axes.shown, display = what.to.display, type = 'n')

### draw spider plot
  if (display.spider == TRUE) orglspider (spec.data.ord, groups = input.data$short.header.file$group, col='lightgrey', alpha = 0.3, choices = axes.shown)

### draw points or groups or species
  if (display.in.diagram == 'species' | display.in.diagram == 'both')
    {
    if (display.species == 'points') rgl.points (sk.sp, col = 'blue', cex = 2)
    if (display.species == 'all.labels') rgl.texts (sk.sp, text = rownames (sk.sp), col = 'blue', cex = 0.7)
    }

  if (display.in.diagram == 'sites' | display.in.diagram == 'both')
    {
    if (display.sites == 'points') rgl.points (sk, col = 'violetred', cex = 2)
    if (display.sites == 'all.labels') rgl.texts (sk, col = 'red', text = rownames (sk), cex = 0.7)
    if (display.sites == 'groups')
      { grp <- input.data$short.header.file$group
        for (i in seq(1:max(range(grp)))) rgl.texts (sk[grp == i,], col = i, text = grp[grp == i])
      }
    }

## plots envelopes
  if (display.envelope)
    {
    library (geometry)
    grp <- input.data$short.header.file$group
    for (i in seq(1:max(range(grp)))) orglhull (spec.data.ord, groups = grp, alpha = 0.3, show.groups = i, col = i, choices = axes.shown)
    }

## plots the group number at the center of group
  if (display.group.center)
    {
    grp <- input.data$short.header.file$group
    orglcenter(spec.data.ord, groups = grp, show.groups=i, choices = axes.shown, cex = if (display.envelope) 1.3 else 1)
    }

## display short header as 3D surface
  if (display.header & display.header.style == 'surface') orglsurf (spec.data.ord,  input.data$short.header.file$factor, add=TRUE, choices = axes.shown)

## close the progress bar    
if (!is.null (pb)) close (pb)    
    
## creates buttoms for orglplot
  rgl.bringtotop (stay = F)
  library (tcltk)
  library (tkrgl)
  directory <- paste('3D_snapshots_', format (Sys.time(), "\%y\%m\%d_\%H\%M\%OS"), sep = '')
  base <- tktoplevel()
  tkwm.title(base, "3D")
  spec.frm <- tkframe(base,borderwidth=2)
  frame.u <- tkframe(spec.frm, relief="groove", borderwidth=2)
  frame.b <- tkframe(spec.frm, relief="groove", borderwidth=2)
  tkpack(tklabel(frame.u, text="Figure rotation"))
  tkpack (spinControl(frame.u, rgl.cur()))
  tkpack (tkbutton(frame.b, text = "Take a snapshot", command = function() {dir.create (directory); rgl.bringtotop (stay = F); rgl.snapshot(filename = paste(directory,'/snapshot_', format (Sys.time(), "\%y\%m\%d_\%H\%M\%OS1"),'.png', sep = ''), fmt = 'png', top = T)}))
  tkpack(tkbutton (frame.b, text = "Show the snapshot", command = function (){try(dir.create (directory)); sel.file <- choose.files(default = paste (getwd(), '/', directory, '/*.png', sep = ''), multi = FALSE); if (length (unlist(strsplit(sel.file, split = ''))) > 1) shell.exec (sel.file)}))
  tkpack (tkbutton (frame.b, text = "Show summary", command = function (){try(shell.exec (paste (getwd(), '/ordi-result.txt', sep = '')))}))
  quit <- tkbutton(base, text = "Quit", bg = 'red', command = function() {tkdestroy(base); rgl.close()})
  tkpack (frame.u, frame.b, fill = "x")
  tkpack(spec.frm, quit)
  tkraise (base)
### keeps window open
  repeat if (rgl.cur() == 0) break

### checks once per day for availability of new ordijuice update
  check.update ()  
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
