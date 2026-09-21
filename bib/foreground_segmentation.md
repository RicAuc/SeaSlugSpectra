### Image Preprocessing: Foreground Segmentation

To ensure chromatic extraction focuses exclusively on the subject and not its ambient environment, we applied an automated segmentation pipeline to all images in the dataset. Each source image consists of a single specimen against a background (e.g., reef, sand, or open water column), with variation in background texture and lighting.

A shell-based batch segmentation script (`segment_nudibranchs.sh`) that utilizes the open-source Python package `rembg` (version 2.0), which implements the convolutional neural network for high-resolution foreground–background separation. 

The pipeline operates as follows:

- **Input Directory**: `images-raw/preprocessed/`  
- **Output Directory**: `images-raw/segmented/`  
- **File Type**: All `.jpg` images are accepted; output is returned in `.png` format with alpha channel transparency (containing a transparent background and an alpha channel mask isolating).

#### Segmentation Methodology

Each image was processed using the `rembg i` CLI interface with alpha matting enabled. This configuration refines object boundaries, preserving biological structures such as cerata, rhinophores, gill plumes, and oral tentacles. Parameters were tuned to minimize over-smoothing and boundary erosion:

- `--alpha-matting`: Enables post-prediction refinement.
- `--alpha-matting-foreground-threshold 240`: Identifies the core nudibranch region.
- `--alpha-matting-background-threshold 15`: Restricts background blending.
- `--alpha-matting-erode-size 5`: Ensures minimal loss of edge fidelity.

The batch script includes automatic installation of Python dependencies (`rembg`, `filetype`, `onnxruntime`, `gradio`, `asyncer`) if not preinstalled.

This segmentation step standardizes all images for subsequent chromatic analysis, ensuring that extracted palettes are based solely on animal pigmentation.