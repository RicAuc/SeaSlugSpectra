# SeaSlugSpectra: Classification-Guided Colour Palette Extraction Framework

## Overview

The *SeaSlugSpectra* project aims to generate colour palettes from curated images of nudibranchs (sea slugs). Recognising the wide morphological and chromatic diversity within this taxon, the project has introduced a classification-driven methodology to guide palette extraction. 

This framework maps the **visual structure** of each image to a defined **palette classification type**, each associated with a customised extraction strategy. By tailoring the extraction process to the visual organisation of the image, the generated palettes better reflect both the perceptual and biological salience of colour features.

---

## Motivation for Classification-Based Palette Extraction

Nudibranchs present particular challenges due to: (i) varying degrees of contrast and tonal modulation and (ii) Morphologies with blended, layered, or segmented pigmentation. To address these challenges, the current framework classifies images into one of several **Visual Signature Types**, each guiding the design of the palette extraction strategy.

---

## Palette Classification Types and Associated Strategies

Each classification type is defined by its characteristic visual structure and linked to a palette extraction strategy. Below, each type is described in terms of visual logic, extraction method, technical notes, and examples (based on analogues from the MoMAColors reference set).

```yaml
classification_types:
  - name: Flat Synthetic
    visual_signature: "Solid blocks of matte colour; high saturation; minimal tonal variation. No gradient transitions."
    strategy: "Direct RGB sampling or k-means clustering with fixed `k = 4–15`. No interpolation or smoothing."
    notes: "Applicable to slugs with bold, uniform colour bands or blocks. The goal is to preserve chromatic identity with minimal generalisation."
    examples: [Alkalay1, Budnitz, Connors, Koons, ustwo]

  - name: High Contrast, Segmented
    visual_signature: "Bright, varied patches with sharply bounded colour regions. High inter-colour contrast."
    strategy: "Adaptive k-means clustering (`k = 4–15`), followed by pruning of low-saturation or low-frequency clusters."
    notes: "Ideal for segmented slugs with modular colour fields, often aposematic. Palette should emphasise separation and diversity."
    examples: [Abbott, Andri]

  - name: Subtle Blending
    visual_signature: "Smooth transitions across hue, saturation, or lightness. No dominant edges."
    strategy: "Extract colour anchors at perceptual inflection points; interpolate using perceptual gradients (e.g., `colorRampPalette()` in HCL space)."
    notes: "Appropriate when colour shifts gradually across the slug’s surface. Palettes must preserve perceptual continuity."
    examples: [Alkalay2]

  - name: Monochromatic Gradient
    visual_signature: "Single dominant hue expressed through variations in lightness, saturation, or chroma. Minimal hue change."
    strategy: "Isolate the principal hue region; sample tones at key lightness intervals; interpolate along a single chromatic axis."
    notes: "Preserves the integrity of tone-on-tone slugs while preventing spurious hue introduction."
    examples: [Althoff, Ernst, Exter, Flash]

  - name: Symmetric Bimodal Gradient
    visual_signature: "Two opposing hue poles connected by a perceptually smooth gradient or transition."
    strategy: "Extract anchors at each chromatic extreme and interpolate across them in LAB or HCL space, ensuring perceptual symmetry."
    notes: "Best applied when a slug exhibits clear warm/cool or complementary contrasts. Ensures balanced perceptual weight across the palette."
    examples: [Avedon, Kippenberger, Picasso, VanGogh]

  - name: Mid-complexity Naturalistic
    visual_signature: "Multiple moderately distinct hues; medium saturation; no single dominant gradient. Colours appear ambient or softly integrated."
    strategy: "Perceptual clustering in LAB space with moderate `k = 4–15`, prioritising perceptual uniqueness over frequency."
    notes: "Designed for realistic or photographic imagery where colour variation exists but is not schematic or symbolic."
    examples: [Clay, Dali, OKeeffe]

  - name: Layered Chromatic Weave
    visual_signature: "Overlapping or interwoven chromatic textures. No strict segmentation or gradient. Colour structure is rhythmic and layered."
    strategy: "Hue-frequency analysis and saliency-weighted sampling. Avoid interpolation or k-means clustering."
    notes: "Suitable for images where visual richness emerges from repeated colour patterns (e.g., marbling, networked pigmentation)."
    examples: [Sidhu]
```

To operationalise this system, the following techniques are employed or proposed, each aligned with one or more classification types

---

| **Method Name**                   | **Used in**                             | **Characteristics**                                                                 | **Strength**                                      | **Weakness**                                                  |
|----------------------------------|------------------------------------------|--------------------------------------------------------------------------------------|--------------------------------------------------|---------------------------------------------------------------|
| Fixed k-means Clustering         | Flat Synthetic                           | RGB or LAB colour space; hard-coded `k = 4–16`                                      | Stable, repeatable output                         | Blind to perceptual redundancy                                 |
| Adaptive k-means Clustering      | High Contrast, Segmented                 | `k` determined by elbow or silhouette score; post-hoc cluster rejection based on mass or saturation | Tailored to visual complexity                     | Requires additional heuristics                                 |
| Perceptual Clustering            | Mid-complexity Naturalistic              | Hierarchical clustering                                                             | Avoids over-splitting similar tones              | Sensitive to image noise                                       |
| Anchor Sampling + Interpolation  | Subtle Blending, Symmetric Bimodal Gradient | Identify chromatic extremes, interpolate in perceptually uniform space (HCL, LAB)  | Creates perceptually smooth gradients            | Dependent on well-chosen anchors                               |
| Monochromatic Interpolation      | Monochromatic Gradient                   | Identify dominant hue region, interpolate across lightness or chroma axis           | Highly constrained and interpretable             | Does not generalise to poly-hued images                        |
| Histogram Sampling without Clustering | Layered Chromatic Weave               | Non-parametric sampling based on hue salience and recurrence                        | Captures visual texture and rhythm               | Difficult to reduce to a fixed-size palette                    |

---

# Request for Expert Review: Colour Palette Extraction Strategies in SeaSlugSpectra

## Project Context

You are invited to evaluate a set of palette extraction strategies designed for an R package called **SeaSlugSpectra**, which generates biologically inspired colour palettes from curated images of nudibranchs (marine sea slugs). These palettes aim to preserve key visual properties of each species’ colouration, and are intended for use in scientific visualisation, ecological communication, and comparative morphological analysis.

Each image is manually assigned to a **classification type** based on its visual organisation (e.g., segmented colours, gradients, tonal variations). This classification determines which palette extraction method is applied.

## Objective of This Review

We are seeking external evaluation of the current extraction techniques, including their:

- Conceptual soundness
- Potential for refinement or replacement

## Extraction Strategy Summary

Each method is tied to a classification of image type. Below, we outline the proposed strategies along with their associated use cases, strengths, and potential issues:

| **#** | **Method Name**                            | **Applied to**                        | **Method**                                                                                 | **Output**                                   | **Strengths**                                                                                 | **Limitations**                                                                                         |
|------|---------------------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------|----------------------------------------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| 1    | Fixed k-means Clustering                    | Flat Synthetic                         | RGB or LAB clustering with fixed `k` within interval                                        | Direct palette with no interpolation         | Fast, stable across images with simple structure                                              | Fails to generalise if the image has subtle chromatic variation                                          |
| 2    | Adaptive k-means Clustering with Pruning    | High Contrast, Segmented               | `k` determined by silhouette score or entropy plateau; noise or low-mass clusters are removed | Direct palette with selective filtering       | Handles visual complexity, responsive to colour diversity                                     | Output sensitive to heuristic thresholds; may oversample noise without refinement                         |
| 3    | Perceptual Clustering                       | Mid-complexity Naturalistic            | Clustering using perceptual distance metrics                     | Clustered palette via perceptual distance     | Respects human perceptual sensitivity to colour differences                                    | Sensitive to image artefacts; clustering may be influenced by uneven illumination or background tones     |
| 4    | Anchor Sampling + Interpolation             | Subtle Blending, Symmetric Bimodal Gradient | Entropy-based anchor identification followed by interpolation in perceptually uniform colour space | Interpolated perceptual gradient             | Produces smooth, perceptually coherent palettes                                               | Selection of representative anchors is non-trivial; subjectivity can affect reproducibility              |
| 5    | Monochromatic Interpolation                 | Monochromatic Gradient                 | Identify dominant hue range; interpolate over lightness or chroma while keeping hue constant | Gradient palette constrained to one hue       | Constrained and interpretable; avoids arbitrary hue introduction                               | Fragile in cases of hidden hue variance or subtle contamination from background elements                 |
| 6    | Histogram-Based Sampling without Clustering | Layered Chromatic Weave                | Hue-frequency analysis and saliency-weighted sampling; avoids clustering                    | Palette based on hue salience and recurrence | Captures colour rhythm and texture diversity in layered or patterned compositions              | Difficult to parameterise; output may vary with resolution or visual noise                               |

---

## Request for Evaluation

We would appreciate your input on the following: (1) **Critique** and (2) **Alternatives**. Please feel free to respond as a code critique, research recommendation, or methodological review. Your feedback will inform the refinement and validation of this typology-driven palette extraction system.

---

# Nudibranch Species Image Mining

Development of an R package called `SeaSlugSpectra`, which generates colour palettes from images of nudibranch species. Each palette corresponds to a single nudibranch species and is derived from curated high-definition imagery.

To support visual validation, palette interpretation, and documentation, we require **direct image links** from different platforms:

- [Nudipixel](https://nudipixel.net/)
- [iNaturalist](https://www.inaturalist.org/)
- [World Register of Marine Species (WoRMS)](https://www.marinespecies.org/)
- [Sea Slug Forum](http://www.seaslugforum.net/)
- [Wikipedia](https://en.wikipedia.org/)

Your task is to perform **deep web research** to retrieve one high-quality image link per source **per nudibranch species** listed below.

## Species List

```
Genus_species
```

For each species, return a structured JSON object with the following schema:

```json
[
  {
    "species": "Caloria militaris",
    "nudi_link": "https://nudipixel.net/photo/00004806",
    "inaturalist_link": "https://www.inaturalist.org/observations/1040000",
    "seaslugforum_link": "http://www.seaslugforum.net/showall/calomili",
    "worms_link": "https://www.marinespecies.org/aphia.php?p=taxdetails&id=730437",
    "wikipedia_link": ""
  }
]
```

If a link is not available, insert an empty string ("") as the value for that source. Each field must be present regardless of content availability. 

The nudibranch must be the main subject (i.e., clear, centered, unobstructed). The photo should be of high resolution, suitable for analysis (preferably JPEG or PNG format).

Avoid images with:

- Obscured or partially out-of-frame subjects
- Low lighting, blur, or compression artifacts
- Always prefer species-level identification over genus-only results.
- If multiple suitable images exist on a platform, pick the best available one (well-composed, visually diagnostic).
- Include only direct photo pages or observation links, not category/search pages.

---

# Manual Assignment of Nudibranch Images to Classification Types

## Task Overview

You are tasked with manually assigning each nudibranch image to **exactly one** predefined **classification types**. These classification types describe the **visual structure of colour** and determine the appropriate method for palette extraction. Each classification type is documented in `palette_metadata.json`, and includes:

- **`visual_signature`**: Describes the formal colour structure of the image
- **`nudibranch_signature`**: Biological analogy based on pigmentation pattern
- **`strategy`**: Strategy to be used in extracting a colour palette from the image

---

## Instructions

### Step-by-Step Procedure

1. **Carefully examine the nudibranch image**, considering:
   - The number of distinct colours
   - How colour regions are organised (segmented, blended, layered)
   - Whether the pigmentation shows symmetry, gradients, or repetition

2. **Compare these visual features** to each classification type’s `visual_signature` in `palette_metadata.json`.

3. **Consult the `nudibranch_signature`** to evaluate how well the biological description matches the species' colour traits.

4. **Select the single best-matching classification**, based on visual and biological alignment.

5. **Record the result** by inserting a new field in the species metadata:

`"classification_type": "<Exact name from classification schema>"`

## Accepted Classification Values

Use **only one** of the following **verbatim** values:

```
`Flat Synthetic`
`High Contrast, Segmented`
`Subtle Blending`
`Monochromatic Gradient`
`Symmetric Bimodal Gradient`
`Mid-complexity Naturalistic`
`Layered Chromatic Weave`
```

---

## Classification Guidelines

| Type                         | Visual Clues |
|------------------------------|---------------|
| **Flat Synthetic**           | Banded or solid colour zones; sharp borders; minimal shading |
| **High Contrast, Segmented** | Distinct patches with abrupt transitions; no blending |
| **Subtle Blending**          | Hue or brightness shifts smoothly across surface |
| **Monochromatic Gradient**   | Dominated by a single hue with tonal variation only |
| **Symmetric Bimodal Gradient** | Two contrasting hues with a perceptual bridge or gradient |
| **Mid-complexity Naturalistic** | Medium-saturation, soft transitions, photographic tone diversity |
| **Layered Chromatic Weave**  | Marbled or repeated colour patterns; semi-translucent or textured layers |

---

## Example Metadata Output

A complete metadata block with a filled classification might look like:

```json
{
"species_name": "Chromodoris willani",
"image_filename": "Chromodoris_willani.jpg",
...
"classification_type": "Flat Synthetic"
}
```

- Each image **must be assigned** one classification type.
- Refer to `palette_metadata.json` as the source for definitions.

---

# Nudibranch Metadata Completion

I am developing an R package called `SeaSlugSpectra` that generates biologically inspired colour palettes from images of nudibranch species.

I have a list of species (scientific names in `Genus_species` format) and a corresponding `image_metadata.json` file that needs to be filled with biologically accurate metadata.

Help complete the following metadata fields for each species. The JSON structure will be programmatically integrated into the library project. Please return the results in structured JSON format matching the schema below.

## Output Format

For each species, return a JSON object structured as the here example:

```json
"Glaucus_atlanticus": {
  "species_name": "Glaucus atlanticus",
  "common_name": "Blue dragon, sea swallow, blue sea slug",
  "image_filename": "Glaucus_atlanticus.jpg",
  "location_distribution": "Pelagic zone (open ocean), carried by winds and currents; primarily tropical and subtropical areas. Documented sightings include Bay of Bengal, off Tamil Nadu and Andhra Pradesh in India. Populations are localized within distinct ocean basins.",
  "depth": "Surface waters, typically floating on the ocean surface.",
  "habitat": "Open ocean surface.",
  "size_mm": "30",
  "taxonomy": {
    "order": "Nudibranchia",
    "family": "Glaucidae"
  },
  "diet": "Cnidarians, including venomous siphonophores like the Portuguese man o' war. Uses a radula with serrated teeth, strong jaw, and denticles to grasp and chip prey.",
  "interesting_facts": "Glaucus atlanticus is a pelagic sea slug that floats on the ocean surface, feeding on jellyfish and other cnidarians. It has a unique ability to store the stinging cells (nematocysts) of its prey in its own tissues.",
  "color_notes": "Ventral side (upwards) is dark and pale blue; true dorsal surface (downwards) is silvery grey. Features dark blue stripes on its head. Dorsal area of foot varies from dark blue to brown with a silver central position.",
  "classification_type": "",
  "pic_location": "Nelson Bay, Australia",
  "nudi_link": "https://nudipixel.net/species/glaucus_atlanticus",
  "inaturalist_link": "https://www.inaturalist.org/taxa/50498-Glaucus-atlanticus",
  "seaslugforum_link": "http://www.seaslugforum.net/factsheet/glauatla",
  "worms_link": "https://www.marinespecies.org/aphia.php?p=taxdetails&id=181238",
  "wikipedia_link": "https://en.wikipedia.org/wiki/Glaucus_atlanticus"
}
```

You may consult credible sources such as Sea Slug Forum, WoRMS, iNaturalist, Wikipedia, Nudipixel, scientific papers, and nudibranch photo ID guides. If no data exists for a field, use `""`.

```json
{
  "species_name": "Scientific name in 'Genus species' format",
  "common_name": "Recognised English name of the species (if available)",
  "image_filename": "Filename of the corresponding image stored in 'images-raw/' (e.g., 'Glossodoris_atromarginata.jpg')",
  "location_distribution": "Narrative description of the known geographic distribution (e.g., 'Widespread in the Indo-Pacific, including Philippines, Indonesia, and Great Barrier Reef')",
  "depth": "Approximate depth of observation, in metres or descriptive terms (e.g., '0–20', 'shallow reef')",
  "habitat": "Microhabitat or substrate association (e.g., 'coral rubble', 'seagrass beds', 'sandy slope')",
  "size_mm": "Typical adult size in millimetres (integer or range, e.g., '25–40')",
  "taxonomy": {
    "order": "Higher taxonomic order (e.g., 'Nudibranchia')",
    "family": "Family name (e.g., 'Chromodorididae')"
  },
  "diet": "Known prey taxa or feeding strategy (e.g., 'Feeds on sponges of genus Dysidea', 'Consumes hydroids')",
  "interesting_facts": "Optional: noteworthy biological traits (e.g., 'Capable of storing nematocysts from hydroids for defense')",
  "color_notes": "Descriptive account of colour morphology and chromatic patterning relevant to palette design",
  "classification_type": "Palette class used in SeaSlugSpectra: one of ['Flat Synthetic', 'High contrast, segmented', 'Subtle Blending', 'Monochromatic Gradient', 'Symmetric Bimodal Gradient', 'Mid-complexity Naturalistic', 'Layered Chromatic Weave']",
  "pic_location": "Short caption or locality reference for the image (e.g., 'Tulamben, Bali', 'Nelson Bay, Australia')",
  "nudi_link": "URL to species page or photo on nudipixel.net (if available)",
  "inaturalist_link": "URL to species page or observation on iNaturalist (taxon or obs. level)",
  "seaslugforum_link": "URL to Sea Slug Forum fact sheet (if applicable)",
  "worms_link": "URL to WoRMS Aphia taxonomic record",
  "wikipedia_link": "URL to species article on Wikipedia (if available)"
}
```
