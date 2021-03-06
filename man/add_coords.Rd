% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manipulation.R
\name{add_coords}
\alias{add_coords}
\title{Adding coordinate variables to the data frame of a SpatialPointsDataFrame}
\usage{
add_coords(spdf, current.proj = TRUE, xynames = NULL, nad83 = FALSE,
  albers = FALSE)
}
\arguments{
\item{spdf}{A SpatialPointsDataFrame to add the coordinates to}

\item{current.proj}{Logical. If \code{TRUE} Then the columns \code{coords.x1} and \code{coords.x2} will be added using the current projection. Defaults to \code{TRUE}.}

\item{xynames}{Optional vector of two character strings to rename the coordinate variables from the current projection. Format is \code{c("replacement for coords.x1", "replacement for coords.x2")}.}

\item{nad83}{Logical. If \code{TRUE} Then the columns \code{LONGITUDE.NAD83} and \code{LATITUDE.NAD83} will be added using NAD83. Defaults to \code{FALSE}.}

\item{albers}{Logical. If \code{TRUE} Then the columns \code{X.METERS.AL} and \code{Y.METERS.AL} will be added using Albers Equal Area. Defaults to \code{FALSE}.}
}
\value{
\code{spdf} with fields added to the data frame as requested.
}
\description{
Adds one or more of the following: the coordinates from the current coordinate refrence system; coordinates in NAD83; and coordinates in Albers Equal Area. This does not change the projection of the SPDF.
}
