# tests/testthat.R
# -----------------------------------------------------------------------------
# This is the test entry point for the SeaSlugSpectra package.
#
# Purpose:
# --------
# This file acts as the bridge between your package and the testthat framework.
# It ensures that all unit tests in the 'tests/testthat/' directory are properly
# executed when the package is checked or tested using standard R tools.
#
# How It Works:
# -------------
# 1. It loads the 'testthat' package, which provides the testing framework.
# 2. It loads the 'SeaSlugSpectra' package to make its functions available.
# 3. It calls 'test_check()', which:
#     - Automatically finds all test files matching 'test-*.R' in 'tests/testthat/'
#     - Executes all 'test_that()' blocks in those files
#
# When Is This File Used?
# ------------------------
# When you run 'devtools::test()'
# When you run 'devtools::check()'
# During 'R CMD check' (e.g., CRAN submission)
#
# Why It Matters:
# ---------------
# Without this file, your testthat tests will *not run* during package checks.
# This means bugs could go undetected and CRAN checks could silently pass without validation.
# Therefore, this file is essential for any R package with automated unit tests.
# -----------------------------------------------------------------------------

library(testthat)           # Load testthat test framework
library(SeaSlugSpectra)     # Load your package to test its functions

test_check("SeaSlugSpectra")  # Run all tests defined in 'tests/testthat/*.R'

