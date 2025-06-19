# data-raw/test_palettes.R
# ------------------------------------------------------------
# Development script for testing palette functionality in the
# SeaSlugSpectra package. This script is not run by the package
# itself—it is for interactive use during development.
# ------------------------------------------------------------

# Load the package (assumes you're working in the project root)
devtools::load_all(".")

# Inspect all palette names
palettes <- SeaSlugSpectra:::load_nudibranch_palettes()
cat("Available palettes:\n")
print(names(palettes))

# View palette structure for a single species
example_species <- "Chromodoris_willani"
cat("\nPreviewing palette for:", example_species, "\n")
print(sea_slug_palette(example_species))

# Display palette with test plots
test_plots(name = example_species, plot.type = "bar")
test_plots(name = example_species, plot.type = "scatter")
test_plots(name = example_species, plot.type = "heatmap")

# Display a gallery of all palettes using first N colours
display_all_palettes(n = 5)

# Optional: check how palettes behave under interpolation
interpolated <- sea_slug_palette(example_species, n = 12, type = "continuous")
print(interpolated)

# End of script
