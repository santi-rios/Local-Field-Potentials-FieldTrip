# LFP Analysis Pipeline Documentation

## Table of Contents
1. [Overview](#overview)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [Directory Structure](#directory-structure)
5. [Pipeline Workflow](#pipeline-workflow)
6. [Configuration](#configuration)
7. [Data Formats](#data-formats)
8. [Analysis Functions](#analysis-functions)
9. [Troubleshooting](#troubleshooting)
10. [References](#references)

## Overview

This repository provides a complete pipeline for analyzing Local Field Potentials (LFPs) using MATLAB and the FieldTrip toolbox. LFPs are low-frequency extracellular voltage signals that reflect the summed activity of neural populations.

### Features
- **Automated preprocessing pipeline**: Filtering, detrending, artifact rejection
- **Spectral analysis**: Power spectral density, time-frequency analysis
- **Band power extraction**: Delta, theta, alpha, beta, gamma bands
- **Event-related analysis**: Trial-based analysis and averaging
- **Coherence analysis**: Inter-channel connectivity
- **Statistical testing**: Condition comparisons with multiple comparison corrections
- **Publication-ready visualizations**: Customizable plotting functions

## Installation

### Prerequisites
- MATLAB (R2018b or later recommended)
- FieldTrip toolbox (latest version)

### Step 1: Install FieldTrip

Download FieldTrip from: https://www.fieldtriptoolbox.org/download/

```matlab
% Extract FieldTrip to a location, e.g., ~/Documents/MATLAB/fieldtrip/
% Note the path for configuration
```

### Step 2: Clone this Repository

```bash
git clone https://github.com/santi-rios/Local-Field-Potentials-FieldTrip.git
cd Local-Field-Potentials-FieldTrip
```

### Step 3: Configure the Pipeline

1. Copy the configuration template:
   ```matlab
   copyfile('config/config_template.m', 'config/config.m')
   ```

2. Edit `config/config.m` and update the FieldTrip path:
   ```matlab
   cfg.paths.fieldtrip = '/path/to/your/fieldtrip';
   ```

3. Adjust other parameters as needed for your experimental setup

## Quick Start

### Initialize the Pipeline

```matlab
% Start MATLAB and navigate to the repository directory
cd /path/to/Local-Field-Potentials-FieldTrip

% Initialize the pipeline
init_pipeline
```

### Basic Workflow

```matlab
% 1. Place your raw data in data/raw/

% 2. Run preprocessing
run scripts/run_preprocessing.m

% 3. Run analysis
run scripts/run_analysis.m

% Or use the complete example workflow:
run scripts/example_workflow.m
```

## Directory Structure

```
Local-Field-Potentials-FieldTrip/
├── README.md                  # Main repository README
├── init_pipeline.m            # Initialization script
├── .gitignore                 # Git ignore file
│
├── config/                    # Configuration files
│   ├── config_template.m      # Template configuration
│   └── config.m               # Your custom configuration (create from template)
│
├── data/                      # Data directory
│   ├── raw/                   # Raw LFP recordings (not tracked by git)
│   └── processed/             # Preprocessed data (not tracked by git)
│
├── scripts/                   # Analysis scripts
│   ├── run_preprocessing.m    # Preprocessing pipeline
│   ├── run_analysis.m         # Analysis pipeline
│   └── example_workflow.m     # Complete example workflow
│
├── functions/                 # Utility functions
│   ├── load_lfp_data.m        # Data loading function
│   ├── extract_band_power.m   # Band power extraction
│   └── plot_lfp_traces.m      # Visualization function
│
├── results/                   # Analysis outputs
│   ├── figures/               # Generated figures (not tracked by git)
│   └── stats/                 # Statistical results (not tracked by git)
│
└── docs/                      # Documentation
    └── USER_GUIDE.md          # This file
```

## Pipeline Workflow

### 1. Data Loading
Load raw LFP data from various formats (Neuralynx, Plexon, Blackrock, etc.)

```matlab
data = load_lfp_data(filename, format);
```

### 2. Preprocessing
- **Filtering**: Bandpass filter (typically 1-300 Hz for LFPs)
- **Detrending**: Remove linear trends
- **Artifact rejection**: Detect and remove artifacts
- **Re-referencing**: Common average or specific reference

### 3. Spectral Analysis
- **Power Spectral Density (PSD)**: Compute frequency power
- **Time-Frequency Analysis**: Event-related spectral dynamics
- **Band Power**: Extract power in specific frequency bands

### 4. Statistical Analysis
- Compare conditions
- Cluster-based permutation testing
- Multiple comparison corrections

### 5. Visualization
- LFP traces
- Power spectra
- Time-frequency plots
- Topographic maps (for multi-channel)

## Configuration

The `config.m` file controls all pipeline parameters:

### Path Configuration
```matlab
cfg.paths.fieldtrip = '/path/to/fieldtrip';
cfg.paths.data_raw = 'data/raw';
cfg.paths.data_processed = 'data/processed';
```

### Preprocessing Parameters
```matlab
cfg.preproc.filter.lowpass = 300;  % Hz
cfg.preproc.filter.highpass = 1;   % Hz
cfg.preproc.artifact.threshold = 5; % SD
```

### Analysis Parameters
```matlab
cfg.analysis.psd.foilim = [1 100];  % Frequency range
cfg.analysis.timefreq.foi = 1:1:100; % Frequencies of interest
```

## Data Formats

### Supported Input Formats
- **Neuralynx** (.ncs files)
- **Plexon** (.nex files)
- **Blackrock** (.nev files)
- **MATLAB** (.mat files)
- **Generic** (via FieldTrip's automatic format detection)

### Data Structure
FieldTrip uses a standardized data structure:
```matlab
data.label     % Channel names
data.fsample   % Sampling frequency
data.trial     % Cell array of trials
data.time      % Time vectors
```

## Analysis Functions

### load_lfp_data
Load data from various formats
```matlab
data = load_lfp_data(filename, format);
```

### extract_band_power
Extract power in specific frequency bands
```matlab
theta_power = extract_band_power(freq_data, 'theta');
custom_band = extract_band_power(freq_data, [10 20]);
```

Available bands:
- `delta`: 1-4 Hz
- `theta`: 4-8 Hz
- `alpha`: 8-13 Hz
- `beta`: 13-30 Hz
- `gamma`: 30-100 Hz

### plot_lfp_traces
Visualize LFP traces
```matlab
plot_lfp_traces(data, channels, time_range, save_path);
```

## Troubleshooting

### FieldTrip Not Found
**Error**: `Undefined function or variable 'ft_defaults'`

**Solution**: 
1. Verify FieldTrip is installed
2. Check the path in `config.m`
3. Manually add FieldTrip: `addpath('/path/to/fieldtrip'); ft_defaults;`

### Out of Memory
**Error**: MATLAB runs out of memory during analysis

**Solution**:
1. Process data in segments
2. Reduce frequency resolution
3. Process channels separately
4. Use `cfg.keeptrials = 'no'` to average trials

### No Data Loaded
**Error**: Data structure is empty

**Solution**:
1. Check file path and format
2. Verify file permissions
3. Check if file format is supported by FieldTrip
4. Try manual loading to debug

### Artifact Detection Too Sensitive
**Issue**: Too many artifacts detected

**Solution**:
1. Adjust `cfg.preproc.artifact.threshold` (increase value)
2. Visually inspect data to determine appropriate threshold
3. Consider manual artifact marking

## References

### FieldTrip Documentation
- Main website: https://www.fieldtriptoolbox.org/
- Tutorial: https://www.fieldtriptoolbox.org/tutorial/
- FAQ: https://www.fieldtriptoolbox.org/faq/

### Key Publications
- Oostenveld et al. (2011). FieldTrip: Open Source Software for Advanced Analysis of MEG, EEG, and Invasive Electrophysiological Data. *Computational Intelligence and Neuroscience*.

### LFP Analysis Resources
- Buzsáki, G., Anastassiou, C. A., & Koch, C. (2012). The origin of extracellular fields and currents—EEG, ECoG, LFP and spikes. *Nature Reviews Neuroscience*, 13(6), 407-420.
- Einevoll, G. T., Kayser, C., Logothetis, N. K., & Panzeri, S. (2013). Modelling and analysis of local field potentials for studying the function of cortical circuits. *Nature Reviews Neuroscience*, 14(11), 770-785.

## Support

For issues or questions:
1. Check the [FieldTrip FAQ](https://www.fieldtriptoolbox.org/faq/)
2. Review this documentation
3. Open an issue on GitHub
4. Contact your laboratory's data analysis expert

## License

This pipeline is provided as-is for research purposes. Please cite FieldTrip when using this pipeline for publications.
