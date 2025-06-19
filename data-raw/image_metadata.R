## code to prepare `image_metadata` dataset goes here

library(jsonlite)

image_metadata <- fromJSON("data-raw/image_metadata.json")

# Access species names
image_metadata$species_name

