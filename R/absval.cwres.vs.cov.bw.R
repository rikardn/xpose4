#' Absolute conditional weighted residuals vs covariates for Xpose 4
#' 
#' This creates a stack of box and whisker plot of absolute population
#' conditional weighted residuals (|CWRES|) vs covariates, and is a specific
#' function in Xpose 4.  It is a wrapper encapsulating arguments to the
#' code\link{xpose.plot.bw} function. Most of the options take their default
#' values from xpose.data object but may be overridden by supplying them as
#' arguments.
#' 
#' Each of the covariates in the Xpose data object, as specified in
#' \code{object@Prefs@Xvardef$Covariates}, is evaluated in turn, creating a
#' stack of plots.
#' 
#' Conditional weighted residuals (CWRES) require some extra steps to
#' calculate. See \code{\link{compute.cwres}} for details.
#' 
#' A wide array of extra options controlling box-and-whisker plots are
#' available. See \code{\link{xpose.plot.bw}} for details.
#' 
#' @param object An xpose.data object.
#' @param xlb A string giving the label for the x-axis. \code{NULL} if none.
#' @param main The title of the plot.  If \code{"Default"} then a default title
#' is plotted. Otherwise the value should be a string like \code{"my title"} or
#' \code{NULL} for no plot title.  
#' @param \dots Other arguments passed to \code{\link{xpose.plot.bw}}.
#' @return Returns a stack of box-and-whisker plots of |CWRES| vs covariates.
#' @author E. Niclas Jonsson, Mats Karlsson, Andrew Hooker & Justin Wilkins
#' @seealso \code{\link{xpose.plot.bw}}, \code{\link{xpose.panel.bw}},
#' \code{\link{compute.cwres}}, \code{\link[lattice]{bwplot}},
#' \code{\link{xpose.prefs-class}}, \code{\link{xpose.data-class}}
#' @keywords methods
#' @examples
#' ## Here we load the example xpose database 
#' xpdb <- simpraz.xpdb
#' 
#' absval.cwres.vs.cov.bw(xpdb)
#' 
#' 
#' @export 
#' @family specific functions 

absval.cwres.vs.cov.bw <-
  function(object,
           xlb = "|CWRES|",
           main="Default",
           ...) {
    
    if (is.null(xvardef("covariates", object))) {
      return(cat("Covariates are not properly set in the database!\n"))
    }
    
    if(is.null(xvardef("cwres",object))) {
      return(cat("There are no CWRES defined in the database!\n"))    
    }
    
    
    ## create list for plots
    number.of.plots <- 0
    for (i in xvardef("covariates", object)) {
      number.of.plots <- number.of.plots + 1
    }
    plotList <- vector("list",number.of.plots)
    
    
    ## loop through covariates
    plot.num <- 0 # initialize plot number
    for (i in xvardef("covariates", object)) {
      
      xplot <- xpose.plot.bw(xvardef("cwres",object),
                             i,
                             object,
                             main=NULL,
                             xlb=xlb,
                             binvar = i,
                             funx="abs",
                             pass.plot.list = TRUE,
                             ...)
      
      
      plot.num <- plot.num+1
      plotList[[plot.num]] <- xplot
    }
    
    default.plot.title <- paste("|",xlabel(xvardef("cwres",object),object),"| vs ",
                                "Covariates", sep="")
    
    plotTitle <- xpose.multiple.plot.title(object=object,
                                           plot.text = default.plot.title,
                                           main=main,
                                           ...)
    obj <- xpose.multiple.plot(plotList,plotTitle,...)
    return(obj)
    
  }
