# SeaSlugSpectra: Classification-Guided Colour Palette Extraction Framework

## Overview

The *SeaSlugSpectra* project aims to generate colour palettes from curated images of nudibranchs (sea slugs). Recognising the wide morphological and chromatic diversity within this taxon, the project has introduced a classification-driven methodology to guide palette extraction. 

This framework maps the **visual structure** of each image to a defined **palette classification type**, each associated with a customised extraction strategy. By tailoring the extraction process to the visual organisation of the image, the generated palettes better reflect both the perceptual and biological salience of colour features.

---

## Motivation for Classification-Based Palette Extraction

Nudibranchs present particular challenges due to:

- Varying degrees of contrast and tonal modulation
- Morphologies with blended, layered, or segmented pigmentation

To address these challenges, the current framework classifies images into one of several **Visual Signature Types**, each guiding the design of the palette extraction strategy. This allows for palettes that are not only technically consistent but also **aesthetically and biologically meaningful**.

---

## Palette Classification Types and Associated Strategies

Each classification type is defined by its characteristic visual structure and linked to a palette extraction strategy. Below, each type is described in terms of visual logic, extraction method, technical notes, and examples (based on analogues from the MoMAColors reference set).

### 1. Flat Synthetic

- **Visual Signature**: Solid blocks of matte colour; high saturation; minimal tonal variation. No gradient transitions.
- **Strategy**: Direct RGB sampling or k-means clustering with fixed `k = 4–6`. No interpolation or smoothing.
- **Notes**: Applicable to slugs with bold, uniform colour bands or blocks. The goal is to preserve chromatic identity with minimal generalisation.
- **Examples**: Alkalay1, Budnitz, Connors, Koons, ustwo

### 2. High Contrast, Segmented

- **Visual Signature**: Bright, varied patches with sharply bounded colour regions. High inter-colour contrast. 
- **Strategy**: Adaptive k-means clustering (`k ≈ 6–10`), followed by pruning of low-saturation or low-frequency clusters.
- **Notes**: Ideal for segmented slugs with modular colour fields, often aposematic. Palette should emphasise separation and diversity.
- **Examples**: Abbott, Andri

### 3. Subtle Blending

- **Visual Signature**: Smooth transitions across hue, saturation, or lightness. No dominant edges.
- **Strategy**: Extract colour anchors at perceptual inflection points; interpolate using perceptual gradients (e.g., `colorRampPalette()` in HCL space).
- **Notes**: Appropriate when colour shifts gradually across the slug’s surface. Palettes must preserve perceptual continuity.
- **Examples**: Alkalay2

### 4. Monochromatic Gradient

- **Visual Signature**: Single dominant hue expressed through variations in lightness, saturation, or chroma. Minimal hue change.
- **Strategy**: Isolate the principal hue region; sample tones at key lightness intervals; interpolate along a single chromatic axis.
- **Notes**: Preserves the integrity of tone-on-tone slugs while preventing spurious hue introduction.
- **Examples**: Althoff, Ernst, Exter, Flash

### 5. Symmetric Bimodal Gradient

- **Visual Signature**: Two opposing hue poles connected by a perceptually smooth gradient or transition.
- **Strategy**: Extract anchors at each chromatic extreme and interpolate across them in LAB or HCL space, ensuring perceptual symmetry.
- **Notes**: Best applied when a slug exhibits clear warm/cool or complementary contrasts. Ensures balanced perceptual weight across the palette.
- **Examples**: Avedon, Kippenberger, Picasso, VanGogh

### 6. Mid-complexity Naturalistic

- **Visual Signature**: Multiple moderately distinct hues; medium saturation; no single dominant gradient. Colours appear ambient or softly integrated.
- **Strategy**: Perceptual clustering in LAB space with moderate `k = 5–7`, prioritising perceptual uniqueness over frequency.
- **Notes**: Designed for realistic or photographic imagery where colour variation exists but is not schematic or symbolic.
- **Examples**: Clay, Dali, OKeeffe

### 7. Layered Chromatic Weave

- **Visual Signature**: Overlapping or interwoven chromatic textures. No strict segmentation or gradient. Colour structure is rhythmic and layered.
- **Strategy**: Hue-frequency analysis and saliency-weighted sampling. Avoid interpolation or k-means clustering.
- **Notes**: Suitable for images where visual richness emerges from repeated colour patterns (e.g., marbling, networked pigmentation).
- **Examples**: Sidhu

---

## Technical Summary of Extraction Methods

To operationalise this system, the following techniques are employed or proposed, each aligned with one or more classification types:

### Fixed k-means Clustering
- Used in: Flat Synthetic
- Characteristics: RGB or LAB colour space; hard-coded `k = 4–16`
- Strength: Stable, repeatable output
- Weakness: Blind to perceptual redundancy

### Adaptive k-means Clustering
- Used in: High Contrast, Segmented
- Characteristics: `k` determined by elbow or silhouette score; post-hoc cluster rejection based on mass or saturation
- Strength: Tailored to visual complexity
- Weakness: Requires additional heuristics

### Perceptual Clustering
- Used in: Mid-complexity Naturalistic
- Characteristics: Hierarchical clustering
- Strength: Avoids over-splitting similar tones
- Weakness: Sensitive to image noise

### Anchor Sampling + Interpolation
- Used in: Subtle Blending, Symmetric Bimodal Gradient
- Characteristics: Identify chromatic extremes, interpolate in perceptually uniform space (HCL, LAB)
- Strength: Creates perceptually smooth gradients
- Weakness: Dependent on well-chosen anchors

### Monochromatic Interpolation
- Used in: Monochromatic Gradient
- Characteristics: Identify dominant hue region, interpolate across lightness or chroma axis
- Strength: Highly constrained and interpretable
- Weakness: Does not generalise to poly-hued images

### Histogram Sampling without Clustering
- Used in: Layered Chromatic Weave
- Characteristics: Non-parametric sampling based on hue salience and recurrence
- Strength: Captures visual texture and rhythm
- Weakness: Difficult to reduce to a fixed-size palette

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

Each method is tied to a classification of image type. Below, we outline the proposed strategies along with their associated use cases, strengths, and potential issues.

---

### 1. Fixed k-means Clustering

- **Applied to**: Flat Synthetic
- **Method**: RGB or LAB clustering with fixed `k` within interval
- **Output**: Direct palette with no interpolation
- **Strengths**: Fast, stable across images with simple structure
- **Limitations**: Fails to generalise if the image has subtle chromatic variation

---

### 2. Adaptive k-means Clustering with Pruning

- **Applied to**: High Contrast, Segmented
- **Method**: `k` determined by silhouette score or entropy plateau; noise or low-mass clusters are removed
- **Strengths**: Handles visual complexity, responsive to colour diversity
- **Limitations**: Output sensitive to heuristic thresholds; may oversample noise without refinement

---

### 3. Perceptual Clustering

- **Applied to**: Mid-complexity Naturalistic
- **Method**: Clustering using perceptual distance metrics (`deltaE94`, `deltaE2000`)
- **Strengths**: Respects human perceptual sensitivity to colour differences
- **Limitations**: Sensitive to image artefacts; clustering may be influenced by uneven illumination or background tones

---

### 4. Anchor Sampling + Interpolation

- **Applied to**: Subtle Blending, Symmetric Bimodal Gradient
- **Method**: Entropy-based anchor identification followed by interpolation in perceptually uniform colour space (e.g., HCL or LAB)
- **Strengths**: Produces smooth, perceptually coherent palettes
- **Limitations**: Selection of representative anchors is non-trivial; subjectivity can affect reproducibility

---

### 5. Monochromatic Interpolation

- **Applied to**: Monochromatic Gradient
- **Method**: Identify dominant hue range; interpolate over lightness or chroma while keeping hue constant
- **Strengths**: Constrained and interpretable; avoids arbitrary hue introduction
- **Limitations**: Fragile in cases of hidden hue variance or subtle contamination from background elements

---

### 6. Histogram-Based Sampling without Clustering

- **Applied to**: Layered Chromatic Weave
- **Method**: Identify hue peaks using histogram salience or recurrence weighting
- **Strengths**: Captures colour rhythm and texture diversity in layered or patterned compositions
- **Limitations**: Difficult to parameterise; output may vary with resolution or visual noise

---

## Request for Evaluation

We would appreciate your input on the following:

1. **Critique**
2. **Alternatives**

Please feel free to respond as a code critique, research recommendation, or methodological review. Your feedback will inform the refinement and validation of this typology-driven palette extraction system.

---

# Manual Assignment of Nudibranch Images to Classification Types

## Task Overview

You are tasked with manually assigning each nudibranch image to **exactly one** of seven predefined **classification types** used in the *SeaSlugSpectra* project. These classification types describe the **visual structure of colour** and determine the appropriate method for palette extraction.

Each classification type is documented in `palette_metadata.json`, and includes:

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

- `Flat Synthetic`
- `High Contrast, Segmented`
- `Subtle Blending`
- `Monochromatic Gradient`
- `Symmetric Bimodal Gradient`
- `Mid-complexity Naturalistic`
- `Layered Chromatic Weave`

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

`
{
"species_name": "Chromodoris willani",
"image_filename": "Chromodoris_willani.jpg",
...
"classification_type": "Flat Synthetic"
}
`

---

## Important Notes

- Each image **must be assigned** one classification type.
- Refer to `palette_metadata.json` as the authoritative source for definitions.

