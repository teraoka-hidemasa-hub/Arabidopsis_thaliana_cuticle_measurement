# Python scripts for TEM-based cuticle thickness analysis

This repository contains a Python script used for semi-automated analysis of
transmission electron microscopy (TEM)-derived luminance intensity profiles for measurement of cell wall and cuticle thickness.



## Overview

### Workflow

This workflow was developed to quantify plant cell wall and cuticle thickness from TEM images. In TEM images, the cuticle typically appears as an electron-dense region with lower luminance values than the adjacent cell wall. The workflow identifies candidate cuticle regions using luminance intensity profiles extracted from ImageJ/Fiji. 

The analysis is based on luminance profile data obtained from TEM images that have been manually processed in ImageJ/Fiji to align the inner edge of the cell wall horizontally. The script processes the exported luminance profiles and calculates percentile-based luminance values. Because low luminance values correspond to electron-dense cuticle regions, percentile thresholds can be used to reconstruct candidate regions of interest (ROIs) in ImageJ/Fiji. 

Visual validation of reconstructed ROIs is then used to identify the cuticle semi-automatically,  enabling quantitative measurements of both cuticle thickness and the remaining cell wall thickness.

The workflow is as follows:

1. TEM images are processed manually in ImageJ/Fiji.
2. Luminance intensity profiles are exported as CSV files by an ImageJ/Fiji macro.
3. Python script processes the CSV files and extract percentile-based values.
4. The processed CSV files are used in an ImageJ/Fiji macro for ROI reconstruction
   and measurement of cell wall and cuticle thickness.
5. The final percentile threshold is selected based on visual agreement between reconstructed ROIs and the electron-dense cuticle layer in TEM images.

ImageJ macros used in this workflow are provided as Supplementary Datasets in the manuscript.


## Citation

These scripts were used in a manuscript currently under submission.

Details will be updated upon publication. 


## Files

- `percentile-based_luminance_profile_analysis.py`  
  Processes luminance intensity profile CSV files and extracts percentile-based luminance values.

### Input

Input CSV files contain luminance profile values exported from ImageJ/Fiji. Profiles are sampled at regular intervals along the cell wall–cuticle continuum, and each row corresponds to a single sampling position.

### Output

The script generates CSV files containing percentile-based luminance values for each sampling position, which can subsequently be used for ROI reconstruction in ImageJ/Fiji.

### Recommended parameter settings

Recommended percentile ranges may differ depending on sample type and image contrast.

- Stigma: lower percentile ranges (e.g. 3rd–10th percentiles) are typically suitable.
- Style: broader percentile ranges may be required.

Lower percentile thresholds generate smaller ROIs corresponding to the darkest electron-dense regions, whereas higher percentile thresholds generate broader ROIs.

Percentile ranges should be optimized empirically for each dataset.

## Requirements

The scripts were tested with the following environment:

- Python 3.11
- pandas 2.1.4
- numpy 1.26.4

## Usage

Run the script in a Python environment:

```bash
python percentile-based_luminance_profile_analysis.py
```

Before running, edit the input and output file paths in the script.
