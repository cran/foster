% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSampleValues.R
\name{getSampleValues}
\alias{getSampleValues}
\title{Extract raster values at sample points}
\usage{
getSampleValues(x, s, keepCols = FALSE, filename = "", ...)
}
\arguments{
\item{x}{A Raster* object}

\item{s}{Location of the sample points. Object of class \code{SpatialPointsDataFrame} generated with \code{\link[foster]{getSample}}}

\item{keepCols}{Should the columns of \code{s} be retained? Default is FALSE}

\item{filename}{Character. Output filename including path to directory. File will be automatically saved as an ESRI Shapefile and any extension in \code{filename} will be overwritten}

\item{...}{Additional arguments passed to \code{\link[rgdal]{writeOGR}}}
}
\value{
SpatialPointsDataFrame object
}
\description{
Given a Raster* object and a SpatialPointsDataFrame object, the functions returns a SpatialPointsDataFrame objects with the values of the raster at sample points.
}
\examples{
# Load raster package
library(raster)

# Open and stack ALS metrics
elev_p95 <- raster(system.file("extdata/examples/ALS_metrics_p95.tif",package="foster"))
cover <- raster(system.file("extdata/examples/ALS_metrics_cov_mean.tif",package="foster"))
Y_vars <- stack(elev_p95,cover)
names(Y_vars) <- c("p95","cover")

# sample_points is a SpatialPointsDataFrame calculated and saved from getSample
# Load it into memory
load(system.file("extdata/examples/sample_points.RData",package="foster"))

getSampleValues(Y_vars, sample_points)
}
\seealso{
\code{\link[raster]{extract}}
}
