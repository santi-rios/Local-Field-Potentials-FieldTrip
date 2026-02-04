# Local Field Potentials Analysis Pipeline

A complete MATLAB pipeline for analyzing Local Field Potentials (LFPs) using the FieldTrip toolbox.

[![MATLAB](https://img.shields.io/badge/MATLAB-R2018b+-blue.svg)](https://www.mathworks.com/products/matlab.html)
[![FieldTrip](https://img.shields.io/badge/FieldTrip-latest-green.svg)](https://www.fieldtriptoolbox.org/)

## Overview

Local Field Potentials (LFPs) are low-frequency extracellular voltage signals (typically < 300 Hz) recorded from brain tissue, representing the summed, synchronized electrical activity of nearby neural populations. This repository provides a clean, organized pipeline for preprocessing and analyzing LFP data using MATLAB and the FieldTrip toolbox.

### Features

- 🔧 **Complete preprocessing pipeline**: Filtering, detrending, artifact rejection, re-referencing
- 📊 **Spectral analysis tools**: PSD, time-frequency analysis, band power extraction
- 🔗 **Connectivity analysis**: Coherence and phase-locking between channels
- 📈 **Event-related analysis**: Trial averaging and event-locked dynamics
- 📉 **Statistical testing**: Condition comparisons with permutation testing
- 🎨 **Visualization functions**: Publication-ready plots and figures
- ⚙️ **Flexible configuration**: Easy-to-customize parameters
- 📚 **Well-documented**: Comprehensive user guide and examples

## Quick Start

### 1. Installation

```bash
# Clone this repository
git clone https://github.com/santi-rios/Local-Field-Potentials-FieldTrip.git
cd Local-Field-Potentials-FieldTrip
```

### 2. Setup FieldTrip

Download FieldTrip from https://www.fieldtriptoolbox.org/download/ and note the installation path.

### 3. Configure

```matlab
% In MATLAB, copy the configuration template
copyfile('config/config_template.m', 'config/config.m')

% Edit config/config.m and update the FieldTrip path
% cfg.paths.fieldtrip = '/path/to/your/fieldtrip';
```

### 4. Initialize

```matlab
% Initialize the pipeline
init_pipeline
```

### 5. Run Analysis

```matlab
% Place your data in data/raw/
% Then run the preprocessing and analysis scripts
run scripts/run_preprocessing.m
run scripts/run_analysis.m

% Or use the complete example workflow
run scripts/example_workflow.m
```

## Directory Structure

```
Local-Field-Potentials-FieldTrip/
├── init_pipeline.m           # Initialization script
├── config/                   # Configuration files
│   ├── config_template.m     # Template (copy to config.m)
│   └── config.m              # Your settings (create from template)
├── data/                     # Data directory
│   ├── raw/                  # Raw LFP recordings
│   └── processed/            # Preprocessed data
├── scripts/                  # Main analysis scripts
│   ├── run_preprocessing.m   # Preprocessing pipeline
│   ├── run_analysis.m        # Analysis pipeline
│   └── example_workflow.m    # Complete example
├── functions/                # Utility functions
│   ├── load_lfp_data.m       # Data loading
│   ├── extract_band_power.m  # Band power extraction
│   └── plot_lfp_traces.m     # Visualization
├── results/                  # Analysis outputs
│   ├── figures/              # Generated figures
│   └── stats/                # Statistical results
└── docs/                     # Documentation
    └── USER_GUIDE.md         # Detailed user guide
```

## Pipeline Workflow

1. **Data Loading**: Import LFP data from various formats (Neuralynx, Plexon, Blackrock, MATLAB)
2. **Preprocessing**: Filter, detrend, and clean the data
3. **Spectral Analysis**: Compute power spectral density and time-frequency representations
4. **Band Power Extraction**: Extract power in delta, theta, alpha, beta, and gamma bands
5. **Statistical Analysis**: Compare conditions with appropriate corrections
6. **Visualization**: Generate publication-quality figures

## Supported Data Formats

- Neuralynx (.ncs)
- Plexon (.nex)
- Blackrock (.nev)
- MATLAB (.mat)
- And other formats supported by FieldTrip

## Documentation

- **[User Guide](docs/USER_GUIDE.md)**: Comprehensive documentation
- **Configuration Template**: `config/config_template.m` - Well-commented parameters
- **Example Workflow**: `scripts/example_workflow.m` - Complete analysis example
- **Function Documentation**: Each function includes detailed comments

## Analysis Capabilities

### Preprocessing
- Bandpass filtering (customizable frequency range)
- Linear detrending
- Artifact detection and rejection
- Re-referencing (common average or custom)

### Spectral Analysis
- Power Spectral Density (PSD) using multitaper or Welch methods
- Time-frequency analysis (wavelet or multitaper convolution)
- Frequency band power extraction (delta, theta, alpha, beta, gamma)

### Connectivity
- Coherence analysis between channels
- Phase-locking value
- Cross-frequency coupling

### Statistical Testing
- Parametric and non-parametric tests
- Cluster-based permutation testing
- Multiple comparison corrections

## Requirements

- **MATLAB**: R2018b or later (R2020a+ recommended)
- **FieldTrip**: Latest version (download from https://www.fieldtriptoolbox.org/)
- **Memory**: 8GB+ RAM recommended for typical datasets
- **Storage**: Depends on your data size

## Getting Help

1. Check the [User Guide](docs/USER_GUIDE.md) for detailed documentation
2. Review the [FieldTrip documentation](https://www.fieldtriptoolbox.org/tutorial/)
3. Open an issue on GitHub for bugs or questions
4. Contact your laboratory's data analysis team

## Contributing

This is a laboratory tool designed for internal use. If you find bugs or have suggestions for improvements, please open an issue or submit a pull request.

## References

### FieldTrip
Oostenveld, R., Fries, P., Maris, E., & Schoffelen, J. M. (2011). FieldTrip: Open source software for advanced analysis of MEG, EEG, and invasive electrophysiological data. *Computational Intelligence and Neuroscience*, 2011.

### LFP Analysis
- Buzsáki, G., Anastassiou, C. A., & Koch, C. (2012). The origin of extracellular fields and currents—EEG, ECoG, LFP and spikes. *Nature Reviews Neuroscience*, 13(6), 407-420.
- Einevoll, G. T., Kayser, C., Logothetis, N. K., & Panzeri, S. (2013). Modelling and analysis of local field potentials for studying the function of cortical circuits. *Nature Reviews Neuroscience*, 14(11), 770-785.

## License

This project is provided for research purposes. Please cite FieldTrip in any publications using this pipeline.

## Acknowledgments

This pipeline was developed to provide a standardized, reproducible framework for LFP analysis in our laboratory. It builds upon the excellent FieldTrip toolbox developed by the Donders Institute for Brain, Cognition and Behaviour.

---

**For detailed usage instructions, see [docs/USER_GUIDE.md](docs/USER_GUIDE.md)**
