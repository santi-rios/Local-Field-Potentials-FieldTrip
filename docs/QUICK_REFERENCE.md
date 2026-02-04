# Quick Reference Guide

## Setup Checklist

- [ ] Clone repository
- [ ] Install FieldTrip toolbox
- [ ] Copy `config/config_template.m` to `config/config.m`
- [ ] Update FieldTrip path in `config.m`
- [ ] Run `init_pipeline` in MATLAB
- [ ] Place raw data in `data/raw/`

## Common Commands

### Initialization
```matlab
% Start each session with:
init_pipeline
```

### Basic Workflow
```matlab
% Complete analysis in 3 steps:
run scripts/run_preprocessing.m
run scripts/run_analysis.m

% Or use the example workflow:
run scripts/example_workflow.m
```

### Loading Data
```matlab
% Load LFP data:
data = load_lfp_data(filename, 'neuralynx_ncs');
```

### Extract Band Power
```matlab
% Extract specific frequency bands:
theta_power = extract_band_power(freq_data, 'theta');
beta_power = extract_band_power(freq_data, 'beta');
custom_band = extract_band_power(freq_data, [10 20]);
```

### Visualize Data
```matlab
% Plot LFP traces:
plot_lfp_traces(data, channels, [0 10], 'output.png');
```

## Frequency Bands

| Band | Range (Hz) | Usage |
|------|------------|-------|
| Delta | 1-4 | `extract_band_power(freq, 'delta')` |
| Theta | 4-8 | `extract_band_power(freq, 'theta')` |
| Alpha | 8-13 | `extract_band_power(freq, 'alpha')` |
| Beta | 13-30 | `extract_band_power(freq, 'beta')` |
| Gamma | 30-100 | `extract_band_power(freq, 'gamma')` |
| Low Gamma | 30-50 | `extract_band_power(freq, 'lowgamma')` |
| High Gamma | 50-100 | `extract_band_power(freq, 'highgamma')` |
| Custom | [low high] | `extract_band_power(freq, [10 20])` |

## Configuration Quick Reference

### Paths
```matlab
cfg.paths.fieldtrip = '/path/to/fieldtrip';
cfg.paths.data_raw = 'data/raw';
cfg.paths.data_processed = 'data/processed';
```

### Filtering
```matlab
cfg.preproc.filter.lowpass = 300;  % Hz
cfg.preproc.filter.highpass = 1;   % Hz
cfg.preproc.filter.order = 4;
```

### Analysis
```matlab
cfg.analysis.psd.foilim = [1 100];
cfg.analysis.timefreq.foi = 1:1:100;
```

## Troubleshooting

### FieldTrip Not Found
```matlab
% Manually add FieldTrip:
addpath('/path/to/fieldtrip');
ft_defaults;
```

### Out of Memory
```matlab
% Process in segments or reduce resolution:
cfg.foi = 1:5:100;  % Reduce frequency resolution
cfg.keeptrials = 'no';  % Average trials
```

### File Format Issues
```matlab
% Verify supported formats:
% Neuralynx: .ncs
% Plexon: .nex
% Blackrock: .nev
% MATLAB: .mat
```

## Directory Overview

```
data/raw/       → Place raw LFP files here
data/processed/ → Preprocessed data saved here
results/figures/→ Generated figures
results/stats/  → Statistical results
scripts/        → Run main analysis scripts
functions/      → Utility functions
config/         → Pipeline configuration
docs/           → Full documentation
```

## Key FieldTrip Functions Used

- `ft_preprocessing` - Filtering and preprocessing
- `ft_freqanalysis` - Spectral analysis
- `ft_timelockanalysis` - Trial averaging
- `ft_connectivityanalysis` - Coherence/connectivity
- `ft_freqstatistics` - Statistical testing
- `ft_singleplotER` - Plot ERPs/power spectra
- `ft_singleplotTFR` - Plot time-frequency data

## Support Resources

- **User Guide**: `docs/USER_GUIDE.md`
- **FieldTrip Docs**: https://www.fieldtriptoolbox.org/
- **GitHub Issues**: For bugs and questions
- **Examples**: `scripts/example_workflow.m`

## Best Practices

1. ✅ Always run `init_pipeline` at the start of each session
2. ✅ Keep raw data separate from processed data
3. ✅ Document parameter changes in your analysis scripts
4. ✅ Save intermediate results to avoid reprocessing
5. ✅ Use version control for your analysis scripts
6. ✅ Keep backup copies of important data
7. ✅ Validate preprocessing with visual inspection
8. ✅ Use appropriate statistical corrections

## Tips

- Use `cfg_params = config();` to access all parameters
- Modify `config.m` for your specific setup
- Check figures in `results/figures/` after each analysis
- Comment out large data saves during testing
- Use consistent naming for files and variables
- Document any non-standard analysis steps

---

**For detailed information, see [docs/USER_GUIDE.md](docs/USER_GUIDE.md)**
