# Install 'usethis' if not already
install.packages("usethis")
# Create a new R package locally
usethis::create_package()
# Enable Git version control
usethis::use_git()
# Create and push to GitHub repo (you'll be prompted to authenticate if needed)
usethis::use_github()

# Add folders for organisation
usethis::use_data_raw("image_metadata")  # creates 'data-raw/'
dir.create("inst/extdata")               # manually for external images
dir.create("tests")
dir.create("vignettes")

usethis::use_description(fields = list(
  Title = "SeaSlugSpectra: Biologically-Inspired Colour Palettes from Nudibranchs",
  Description = "Generates qualitative colour palettes derived from curated images of marine nudibranch species. Useful for scientific visualisation, design, and outreach.",
  Author = "Your Name [aut, cre]",
  License = "MIT",
  URL = "https://github.com/your_username/SeaSlugSpectra",
  BugReports = "https://github.com/your_username/SeaSlugSpectra/issues"
))

usethis::use_mit_license("Your Name")

usethis::use_readme_md()
usethis::use_r("palettes")         # start main function file
usethis::use_r("ggplot2_scales")   # ggplot-compatible scales
