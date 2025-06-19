# palettes.R
# Core functions for retrieving and visualising nudibranch-based colour palettes
# ------------------------------------------------------------------------------

#' Load palettes from internal JSON
#'
#' Reads palette definitions from the 'palettes/palettes.json' file.
#' Returns a named list of palettes.
#'
#' @return A named list, where each element is a character vector of hex codes.
load_nudibranch_palettes <- function() {
  json_path <- system.file("palettes", "palettes.json", package = "SeaSlugSpectra")
  if (!file.exists(json_path)) {
    stop("Palette data file not found: ", json_path)
  }
  jsonlite::fromJSON(json_path)
}

#' Retrieve a nudibranch colour palette
#'
#' @param name The name of the palette (species), e.g. "Chromodoris_willani"
#' @param n Number of colours to return. If NULL, all colours are returned.
#' @param type "discrete" or "continuous" (interpolated).
#' 
#' @return A character vector of hex colours
#' @export
sea_slug_palette <- function(name, n = NULL, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  palettes <- load_nudibranch_palettes()
  
  if (!name %in% names(palettes)) {
    stop("Palette '", name, "' not found.")
  }
  
  pal <- palettes[[name]]
  
  if (is.null(n)) {
    n <- length(pal)
  }
  
  if (n > length(pal) && type == "discrete") {
    stop("Requested ", n, " colours, but palette '", name, "' only has ", length(pal), " available.")
  }
  
  if (type == "continuous") {
    return(grDevices::colorRampPalette(pal)(n))
  }
  
  return(pal[1:n])
}

#' Display all palettes
#'
#' Creates a grid plot of all available palettes.
#'
#' @param n Number of colours to show per palette
#' @export
display_all_palettes <- function(n = 5) {
  palettes <- load_nudibranch_palettes()
  op <- par(no.readonly = TRUE)
  on.exit(par(op))
  
  n_pal <- length(palettes)
  n_col <- 1
  n_row <- n_pal
  
  par(mar = c(0.2, 4, 0.2, 0.2), mfrow = c(n_row, n_col))
  
  for (i in seq_along(palettes)) {
    pal_name <- names(palettes)[i]
    pal <- sea_slug_palette(pal_name, n = n)
    barplot(rep(1, length(pal)), col = pal, border = NA, space = 0, axes = FALSE, main = "")
    mtext(pal_name, side = 2, line = 0.5, las = 2, cex = 0.7)
  }
}

#' Test palette with a sample plot
#'
#' @param name Name of the palette (species)
#' @param plot.type Type of test plot: "bar", "scatter", or "heatmap"
#' @export
test_plots <- function(name, plot.type = c("bar", "scatter", "heatmap")) {
  plot.type <- match.arg(plot.type)
  pal <- sea_slug_palette(name)
  n <- length(pal)
  
  if (plot.type == "bar") {
    barplot(rep(1, n), col = pal, border = NA, space = 0, axes = FALSE, main = name)
    
  } else if (plot.type == "scatter") {
    x <- rnorm(100)
    y <- rnorm(100)
    col_idx <- cut(y, breaks = n, labels = FALSE)
    plot(x, y, col = pal[col_idx], pch = 19, main = name)
    
  } else if (plot.type == "heatmap") {
    mat <- matrix(runif(100), nrow = 10)
    image(mat, col = grDevices::colorRampPalette(pal)(100), main = name)
  }
}
