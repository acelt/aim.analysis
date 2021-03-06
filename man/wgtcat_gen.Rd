% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatial_manipulation.R
\name{wgtcat_gen}
\alias{wgtcat_gen}
\title{Generate weight category polygons}
\usage{
wgtcat_gen(polygons, idvar, makevalid = TRUE, force = FALSE,
  verbose = FALSE, scale = 1e+05)
}
\arguments{
\item{polygons}{List of spatial polygons data frames. These are the polygons to intersect and should be the same as the polygons used to draw the designs being combined. They must all have a the \code{idvar} variable containing the identities of the individual polygons (e.g. stratum). If you are combining designs that used the same polygons (e.g. two different designs using the exact same sample frame and stratification) ONLY INCLUDE ONE OF THEM. Including duplicates can result in very, very long processing times and failed intersections. They will be intersected sequentially in order, so there may be some slight speed gains if they're sorted smallest to largest, but no guarantees.}

\item{idvar}{Character string. The name of the variable found in every set of polygons that contains the polygon identities.}

\item{makevalid}{Logical. If \code{TRUE} then the function \code{repair_geometry()} will be applied to the product of every geoprocessing step. If \code{FALSE} then there will be no validity checks. It is STRONGLY recommended that you use \code{TRUE} Defaults to \code{TRUE}.}

\item{force}{Logical. This is passed to \code{repair_geometry()} if \code{makevalid = TRUE}. If \code{TRUE} this will force the function to attempt to repair geometry even if there are no errors. This is for the paranoid. Defaults to \code{FALSE}.}

\item{verbose}{Logical. If \code{TRUE} then the function will produce informative messages as it executes its steps. Useful for debugging. Defaults to \code{FALSE}.}

\item{scale}{Numeric. A value to be passed to \code{rgeos::setScale()} to use for the steps of this function. It will be returned to the previous value before the function returns its output. Defaults to \code{1e5} (precision to five decimal places).}
}
\value{
A spatial polygons data frame with the single variable \code{"wgt_cat"} in the data slot containing the unique weight categories.
}
\description{
Create weight category polygons from the intersection of multiple spatial polygons data frames. When combining overlapping designs, weight categories are the unique combinations of the sample frame (or stratification) identities from the designs. This takes a list of spatial polygons data frames which have a common variable containing their unique weighting identifier (e.g. three stratification schemes that all contain a variable named "wgt_cat" that holds the stratum identities) and intersects them to find the weight categories. This is extremely vulnerable to malformed/invalid geometry and so it is highly recommended that you use the argument \code{makevalid = TRUE} to prompt the function to check and attempt to repair geometry as needed after every geoprocessing step. This is slower, but the intersections will almost certainly fail without it. If you are feeling especially paranoid, you can also use \code{force = TRUE} to force repair actions even on valid geometry.
}
