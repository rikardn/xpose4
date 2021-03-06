
#' @export
#' @describeIn absval.iwres.cwres.vs.ipred.pred absolute population weighted residuals (|WRES|) vs
#' population predictions (PRED) and absolute individual weighted residuals
#' (|IWRES|) vs individual predictions (IPRED)
#' 
#' @family specific functions 

absval.iwres.wres.vs.ipred.pred <-
  function(object,
           
           ##aspect="fill",
           main="Default",
           ...) {

  
    if(is.null(check.vars(c("pred","wres","iwres","ipred"),
                          object,silent=FALSE))) {
      return()
    }

    num.of.plots <- 2
    plotList <- vector("list",num.of.plots)

    plot1 <- absval.wres.vs.pred(object,main=NULL,
                              ##aspect=aspect,
                              pass.plot.list=TRUE,
                              ...)
    plot2 <- absval.iwres.vs.ipred(object,main=NULL,
                                ##aspect=aspect,
                                pass.plot.list=TRUE,
                                ...)

    plotList[[1]] <- plot1
    plotList[[2]] <- plot2

    default.plot.title <- "Weighted residuals vs. Predictions"
    
    plotTitle <- xpose.multiple.plot.title(object=object,
                                           plot.text = default.plot.title,
                                           main=main,
                                           ...)
    obj <- xpose.multiple.plot(plotList,plotTitle,...)
    return(obj)

}
