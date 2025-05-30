% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset_vignette.R
\name{dataset_vignette}
\alias{dataset_vignette}
\title{Output a Dataset in a Vignette in the admiral Format}
\usage{
dataset_vignette(dataset, display_vars = NULL, filter = NULL)
}
\arguments{
\item{dataset}{Dataset to output in the vignette

\describe{
\item{Default value}{none}
}}

\item{display_vars}{Variables selected to demonstrate the outcome of the derivation

If \code{display_vars} is not NULL, only the selected variables are visible in the vignette while the
other variables are hidden. They can be made visible by clicking the\verb{Choose the columns to display} button.

\describe{
\item{Permitted values}{list of variables created by \code{exprs()}, e.g., \code{exprs(USUBJID, VISIT)}}
\item{Default value}{\code{NULL}}
}}

\item{filter}{Filter condition

The specified condition is applied to the dataset before it is displayed.

\describe{
\item{Permitted values}{a condition}
\item{Default value}{\code{NULL}}
}}
}
\value{
A HTML table
}
\description{
Output a dataset in a vignette with the pre-specified admiral format.
}
\keyword{dev_utility}
