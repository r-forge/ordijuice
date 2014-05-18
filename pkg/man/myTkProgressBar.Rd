\name{myTkProgressBar}
\alias{myTkProgressBar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
myTkProgressBar
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
myTkProgressBar(title = "R progress bar", label = "", min = 0, max = 1, initial = 0, width = 300)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{title}{
%%     ~~Describe \code{title} here~~
}
  \item{label}{
%%     ~~Describe \code{label} here~~
}
  \item{min}{
%%     ~~Describe \code{min} here~~
}
  \item{max}{
%%     ~~Describe \code{max} here~~
}
  \item{initial}{
%%     ~~Describe \code{initial} here~~
}
  \item{width}{
%%     ~~Describe \code{width} here~~
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
function (title = "R progress bar", label = "", min = 0, max = 1, initial = 0, width = 300) 
{
#  windows (xpos = 0, ypos = 0)
#  plot.new()
#  bringToTop (-1)
#  dev.off(dev.cur())
  library (tcltk)
useText <- FALSE
have_ttk <- as.character(tcl("info", "tclversion")) >= "8.5"
if (!have_ttk && as.character(tclRequire("PBar")) == "FALSE") 
useText <- TRUE
.win <- tktoplevel()
.val <- initial
.killed <- FALSE
tkwm.geometry(.win, sprintf("\%dx80", width + 40))
tkwm.title(.win, title)
#fn <- tkfont.create(family = "helvetica", size = 12)
if (useText) {
#.lab <- tklabel(.win, text = label, font = fn, padx = 20)
.lab <- tklabel(.win, text = label, padx = 20)
tkpack(.lab, side = "left")
fn2 <- tkfont.create(family = "helvetica", size = 16)
.vlab <- tklabel(.win, text = "0\%", font = fn2, padx = 20)
tkpack(.vlab, side = "right")
up <- function(value) {
if (!is.finite(value) || value < min || value > max) 
return()
.val <<- value
tkconfigure(.vlab, text = sprintf("\%d\%\%", round(100 * 
(value - min)/(max - min))))
  }
  }
else {
#.lab <- tklabel(.win, text = label, font = fn, pady = 10)
.lab <- tklabel(.win, text = label, pady = 10)
.tkval <- tclVar(0)
tkpack(.lab, side = "top")
#tkpack(tklabel(.win, text = "", font = fn), side = "bottom")
tkpack(tklabel(.win, text = ""), side = "bottom")
pBar <- if (have_ttk) 
ttkprogressbar(.win, length = width, variable = .tkval)
else tkwidget(.win, "ProgressBar", width = width, variable = .tkval)
tkpack(pBar, side = "bottom")
up <- function(value) {
if (!is.finite(value) || value < min || value > max) 
return()
.val <<- value
tclvalue(.tkval) <<- 100 * (value - min)/(max - min)
  }
  }
getVal <- function() .val
kill <- function() if (!.killed) {
tkdestroy(.win)
.killed <<- TRUE
  }
title <- function(title) tkwm.title(.win, title)
lab <- function(label) tkconfigure(.lab, text = label)
tkbind(.win, "<Destroy>", kill)
up(initial)
tkraise (.win)
structure(list(getVal = getVal, up = up, title = title, label = lab, 
kill = kill, window=.win), class = "tkProgressBar")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
