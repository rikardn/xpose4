% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_nm_table.R
\name{read_nm_table}
\alias{read_nm_table}
\title{Read NONMEM table files produced from simulation.}
\usage{
read_nm_table(nm_table, only_obs = FALSE, method = "default",
  quiet = TRUE, sim_num = FALSE, sim_name = "NSIM")
}
\arguments{
\item{nm_table}{The NONMEM table file to read. A text string.}

\item{only_obs}{Should the non-observation lines in the data set be removed? 
Currently filtered using the expected \code{MDV} column. \code{TRUE} or 
\code{FALSE}.}

\item{method}{The methods to use for reading the tables,  Can be "readr_1", "readr_2", readr_3" or "slow".}

\item{quiet}{Should the error message be verbose or not?}

\item{sim_num}{Should a simulation number be added to simulation tables?}

\item{sim_name}{What name should one use to name the column of the simulation number?}
}
\value{
Returns a data frame of the simulated table with an added column for 
  the simulation number. The data frame is given class \code{c("tbl_df", 
  "tbl", "data.frame")} for easy use with \code{\link[dplyr]{dplyr}}.
}
\description{
The function reads in NONMEM table files produced from the \code{$SIM} line 
in a NONMEM model file.
}
\details{
Currently the function expects the \code{$TABLE} to have a header for each 
new simulation. This means that the \code{NOHEADER} option or 
\code{ONEHEADER} option in the table file is not allowed.
}
\seealso{
Other data functions: \code{\link{add_transformed_columns}},
  \code{\link{change_graphical_parameters}},
  \code{\link{change_misc_parameters}},
  \code{\link{compute.cwres}}, \code{\link{data.checkout}},
  \code{\link{data_extract_or_assign}},
  \code{\link{db.names}}, \code{\link{export.graph.par}},
  \code{\link{export.variable.definitions}},
  \code{\link{import.graph.par}},
  \code{\link{import.variable.definitions}},
  \code{\link{make.sb.data}}, \code{\link{nsim}},
  \code{\link{par_cov_summary}},
  \code{\link{read.TTE.sim.data}},
  \code{\link{read.nm.tables}},
  \code{\link{read_NM_output}},
  \code{\link{simprazExample}},
  \code{\link{tabulate.parameters}}, \code{\link{xlabel}},
  \code{\link{xpose.data}}, \code{\link{xpose.print}},
  \code{\link{xpose4-package}}, \code{\link{xsubset}}
}
\concept{data functions}
