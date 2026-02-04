# Changelog

All notable changes to the LFP Analysis Pipeline will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.0.0] - 2026-02-04

### Added
- Initial release of LFP Analysis Pipeline
- Complete directory structure for organized data analysis
- Initialization script (`init_pipeline.m`)
- Configuration template with comprehensive parameters
- Preprocessing pipeline script (`run_preprocessing.m`)
  - Bandpass filtering (1-300 Hz for LFPs)
  - Detrending
  - Artifact detection and rejection
  - Re-referencing options
- Analysis pipeline script (`run_analysis.m`)
  - Power Spectral Density (PSD) analysis
  - Time-Frequency Representation (TFR)
  - Coherence analysis
  - Event-related analysis
  - Statistical testing
- Utility functions:
  - `load_lfp_data.m` - Load data from multiple formats
  - `extract_band_power.m` - Extract frequency band power
  - `plot_lfp_traces.m` - Visualize LFP traces
- Example workflow script demonstrating complete analysis
- Comprehensive documentation:
  - User Guide with installation and usage instructions
  - README files for each directory
  - Function-level documentation
- `.gitignore` configured for MATLAB and data files
- LICENSE file (MIT)
- CONTRIBUTING guidelines

### Supported Features
- Data formats: Neuralynx, Plexon, Blackrock, MATLAB
- Frequency bands: Delta, Theta, Alpha, Beta, Gamma
- Visualization: PSD, TFR, traces, topographic plots
- Statistics: Permutation testing, cluster correction
- Integration with FieldTrip toolbox

### Documentation
- Main README with quick start guide
- Detailed USER_GUIDE.md
- Inline code documentation
- Example workflow
- Contributing guidelines

---

## Future Enhancements (Planned)

### To Be Added
- [ ] Additional visualization functions
- [ ] Phase-amplitude coupling analysis
- [ ] Automated quality control metrics
- [ ] Batch processing scripts
- [ ] Template for specific experimental paradigms
- [ ] Integration with spike sorting outputs
- [ ] Advanced artifact detection methods
- [ ] Multi-subject analysis tools
- [ ] Export functions for common formats
- [ ] Performance optimization for large datasets

### Under Consideration
- GUI interface for parameter selection
- Real-time analysis capabilities
- Machine learning integration
- Cloud computing support

---

## Version History

**v1.0.0** (2026-02-04)
- Initial release
- Core pipeline functionality
- Basic analysis tools
- Comprehensive documentation
