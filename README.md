
# SeaSlugSpectra

<!-- badges: start -->
<!-- badges: end -->

The goal of **SeaSlugSpectra** is to use of generative models for colour-category inference.

## Project Description 

**SeaSlugSpectra** is an R package under development that aims to construct biologically informed colour palettes from curated and segmented images of nudibranch species. 

Building on curatorial frameworks such as [MoMAColors](https://github.com/BlakeRMills/MoMAColors) and leveraging a structured set of visual-signature classes for colour-pattern interpretation, the project formalises a reproducible workflow for extracting perceptually meaningful palettes tailored to the diverse pigmentation architectures found in sea slugs. 

High-fidelity foreground segmentation ensures that palette extraction operates exclusively on the organismal surface and not on the surrounding substrate or water column. A central methodological component is the integration of generative modelling approaches, such as [nemotron](https://www.nvidia.com/it-it/ai-data-science/foundation-models/nemotron/) to infer latent colour categories, guide cluster selection, and stabilise palette extraction across heterogeneous visual structures. 

These models complement rule-based classification strategies by predicting chromatic archetypes and supporting adaptive palette construction (which are characterised, but the nummern of colors selected and the spectra distribution of these colors with the interval that colors). The project is supported by an extensible metadata architecture describing species traits, colouration notes, and classification-driven extraction strategies optimally to generate slugs specific panels analogously to the ones related for the specifc paintings (e.g, [MOMAexamples](/Users/riccardo/Repositories/SeaSlugSpectra/data-raw/MOMAexamples/)), with a unified pipeline for validation and image-metadata consistency checking.

## Installation

You can install the development version of SeaSlugSpectra like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SeaSlugSpectra)
## basic example code
```

