# tests/testthat/test-palettes.R

test_that("Known palettes load and have correct structure", {
  palettes <- SeaSlugSpectra:::load_nudibranch_palettes()
  expect_true("Chromodoris_willani" %in% names(palettes))
  expect_type(palettes[["Chromodoris_willani"]], "character")
  expect_gt(length(palettes[["Chromodoris_willani"]]), 2)
})

test_that("sea_slug_palette returns correct number of colours", {
  pal <- sea_slug_palette("Chromodoris_willani", n = 3)
  expect_equal(length(pal), 3)
})

test_that("sea_slug_palette errors on unknown name", {
  expect_error(sea_slug_palette("Unknown_species"))
})

test_that("sea_slug_palette errors on excessive n in discrete mode", {
  expect_error(sea_slug_palette("Chromodoris_willani", n = 1000, type = "discrete"))
})

test_that("continuous palette interpolation works", {
  pal <- sea_slug_palette("Chromodoris_willani", n = 10, type = "continuous")
  expect_type(pal, "character")
  expect_equal(length(pal), 10)
})

