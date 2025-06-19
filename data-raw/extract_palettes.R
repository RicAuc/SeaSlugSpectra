
# ==============================================================================
# extract_palettes.R
#
# Objective:
# ----------
# This script extracts dominant colour palettes from curated nudibranch images
# stored in the 'images-raw/' directory. It uses k-means clustering in RGB space
# to identify a fixed number of representative colours per image.
#
# The extracted palettes are stored as a named list in JSON format at:
#   'palettes/palettes.json'
#
# This file becomes a core internal data asset used by SeaSlugSpectra functions
# such as `sea_slug_palette()` and `display_all_palettes()`.
#
# This script is intended for reproducible data preprocessing and is **not**
# included in the runtime package code. Instead, it is run manually when:
#   - New images are added
#   - Palette parameters (e.g., cluster count) are changed
#
# Dependencies: jpeg, jsonlite, tidyverse
# ==============================================================================

library(jpeg)       # For reading .jpg images
library(jsonlite)   # For writing palettes.json
library(tidyverse)  # For general data handling (optional, used for clarity)

# --- Configuration ------------------------------------------------------------

image_dir <- "images-raw"                    # Directory containing JPEG images
output_file <- "palettes/palettes.json"     # Output JSON file
n_colors <- 5                                # Number of dominant colours per palette

# --- Function: extract_palette ------------------------------------------------
# Reads an image, reshapes pixel data, applies k-means clustering in RGB space,
# and returns a character vector of hex colour values.
extract_palette <- function(image_path, n = 5) {
  message("Processing: ", image_path)
  img <- jpeg::readJPEG(image_path)
  
  # Flatten the 3D RGB array into a 2D matrix: rows = pixels, columns = R, G, B
  rgb_data <- as.data.frame(matrix(img, ncol = 3))
  colnames(rgb_data) <- c("R", "G", "B")
  
  # Run k-means clustering
  km <- kmeans(rgb_data, centers = n)
  
  # Convert cluster centroids to hexadecimal colour codes
  hex_colors <- rgb(km$centers[, 1], km$centers[, 2], km$centers[, 3])
  toupper(hex_colors)
}

# --- Process all images -------------------------------------------------------

image_files <- list.files(image_dir, pattern = "\\.jpg$", full.names = TRUE)
palette_list <- list()

for (file in image_files) {
  species_name <- tools::file_path_sans_ext(basename(file))  # e.g. "Chromodoris_willani"
  palette_list[[species_name]] <- extract_palette(file, n = n_colors)
}

# --- Save output as JSON ------------------------------------------------------

write_json(
  x = palette_list,
  path = output_file,
  pretty = TRUE,
  auto_unbox = TRUE
)

message("Palettes saved to: ", output_file)

