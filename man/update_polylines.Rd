% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/google_map_layer_polyline.R
\name{update_polylines}
\alias{update_polylines}
\title{Update polylines}
\usage{
update_polylines(map, data, id, stroke_colour = NULL, stroke_weight = NULL,
  stroke_opacity = NULL, info_window = NULL, layer_id = NULL,
  palette = NULL, legend = F, legend_options = NULL)
}
\arguments{
\item{map}{a googleway map object created from \code{google_map()}}

\item{data}{data frame containing the data to use in the layer. If Null, the
data passed into \code{google_map()} will be used.}

\item{id}{string representing the column of \code{data} containing the id values
for the shapes. The id values must be present in the original data supplied to in order
for the shape to be udpated.}

\item{stroke_colour}{either a string specifying the column of \code{data} containing
the stroke colour of each shape, or a valid hexadecimal numeric HTML style to
be applied to all the shapes}

\item{stroke_weight}{either a string specifying the column of \code{data} containing
the stroke weight of each shape, or a number indicating the width of pixels
in the line to be applied to all the shapes}

\item{stroke_opacity}{either a string specifying the column of \code{data} containing
the stroke opacity of each shape, or a value between 0 and 1 that will be
applied to all the shapes}

\item{info_window}{string specifying the column of data to display in an info
window when a shape is clicked.}

\item{layer_id}{single value specifying an id for the layer. Use this value to
distinguish between shape layers for when using any \code{update_} function, and
for separating legends.}

\item{palette}{a function, or list of functions, that generates hex colours
given a single number as an input. See details.}

\item{legend}{either a logical indiciating if the legend(s) should be displayed, or
a named list indicating which colour attributes should be included in the legend.}

\item{legend_options}{A list of options for controlling the legend.}
}
\description{
Updates specific attributes of polylines. Designed to be
used in a shiny application.
}
\note{
Any polylines (as specified by the \code{id} argument) that do not exist
in the \code{data} passed into \code{add_polylines()} will not be added to the
map. This function will only update the polylines that currently exist on
the map when the function is called.
}
\examples{
\dontrun{

map_key <- 'your_api_key'

## coordinate columns
## plot polylines using default attributes
df <- tram_route
df$id <- c(rep(1, 27), rep(2, 28))

df$colour <- c(rep("#00FFFF", 27), rep("#FF00FF", 28))

google_map(key = map_key) \%>\%
  add_polylines(data = df, lat = 'shape_pt_lat', lon = 'shape_pt_lon',
                stroke_colour = "colour", id = 'id')

## specify width and colour attributes to update
df_update <- data.frame(id = c(1,2),
                        width = c(3,10),
                        colour = c("#00FF00", "#DCAB00"))

google_map(key = map_key) \%>\%
  add_polylines(data = df, lat = 'shape_pt_lat', lon = 'shape_pt_lon',
                stroke_colour = "colour", id = 'id') \%>\%
  update_polylines(data = df_update, id = 'id', stroke_weight = "width",
                   stroke_colour = 'colour')


## encoded polylines
pl <- sapply(unique(df$id), function(x){
  encode_pl(lat = df[ df$id == x , 'shape_pt_lat'], lon = df[ df$id == x, 'shape_pt_lon'])
})

df <- data.frame(id = c(1, 2), polyline = pl)

df_update <- data.frame(id = c(1,2),
                        width = c(3,10),
                        var = c("a","b"))

google_map(key = map_key) \%>\%
  add_polylines(data = df, polyline = 'polyline')

google_map(key = map_key) \%>\%
  add_polylines(data = df, polyline = 'polyline') \%>\%
  update_polylines(data = df_update, id = 'id', stroke_weight = "width",
                   stroke_colour = 'var')

}

}
