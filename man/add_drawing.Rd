% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/google_map_layer_drawing.R
\name{add_drawing}
\alias{add_drawing}
\title{Add Drawing}
\usage{
add_drawing(map, drawing_modes = c("marker", "circle", "polygon", "polyline",
  "rectangle"), delete_on_change = FALSE)
}
\arguments{
\item{map}{a googleway map object created from \code{google_map()}}

\item{drawing_modes}{string vector giving the drawing controls required.
One of one or more of marker, circle, polygon, polyline and rectangle}

\item{delete_on_change}{logical indicating if the currently drawn shapes
should be deleted when a new drawing mode is selected (only works in a reactive environment)}
}
\description{
Adds drawing tools to the map. Particularly useful when in an interactive (shiny) environment.
}
\examples{
\dontrun{

map_key <- 'your_api_key'
google_map(key = map_key) \%>\%
  add_drawing()

}
}
