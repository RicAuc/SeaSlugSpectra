# utils.R
# ----------------------------------------------------------------------
# Purpose:
#   This script defines internal utility functions for the SeaSlugSpectra
#   package. These helpers support core operations such as colour space
#   conversions, palette pruning, and image loading. The functions are
#   intended for internal use only and are not part of the exported API.
#
# Typical Contents:
#   - Colour manipulation utilities (e.g., HEX to RGB conversion)
#   - Filtering and validation logic for extracted palettes
#   - Image I/O and preprocessing helpers
#   - Numerical or data-cleaning functions reused across modules
#
# Notes:
#   All functions in this file should be:
#     • Lightweight and modular
#     • General-purpose (not species- or strategy-specific)
#     • Reusable across classification types
#
# This file complements palettes.R and ggplot2_scales.R by encapsulating
# common operations and minimising redundancy.
# ----------------------------------------------------------------------

# Example utility: Convert HEX to RGB matrix
hex_to_rgb <- function(hex) {
  rgb <- col2rgb(hex)
  return(t(rgb) / 255)
}

# Example utility: Prune low-saturation colours using LAB chroma
prune_low_saturation <- function(colors, threshold = 0.1) {
  lab <- grDevices::convertColor(t(col2rgb(colors)) / 255, "sRGB", "Lab")
  chroma <- apply(lab, 1, function(c) sqrt(c[2]^2 + c[3]^2))
  return(colors[chroma > threshold])
}

# Example utility: Safe image loading with error handling
load_image_safe <- function(filepath) {
  if (!file.exists(filepath)) stop("Image file not found.")
  imager::load.image(filepath)
}

