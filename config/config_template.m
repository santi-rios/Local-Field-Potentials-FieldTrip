% Configuration Template for LFP Analysis Pipeline
% Copy this file to config.m and modify the settings for your analysis
%
% Author: [Your Name]
% Date: [Date]

function cfg = config_template()
    % ======================================================================
    % PATHS CONFIGURATION
    % ======================================================================
    cfg.paths.project_root = fileparts(fileparts(mfilename('fullpath')));
    cfg.paths.data_raw = fullfile(cfg.paths.project_root, 'data', 'raw');
    cfg.paths.data_processed = fullfile(cfg.paths.project_root, 'data', 'processed');
    cfg.paths.results = fullfile(cfg.paths.project_root, 'results');
    cfg.paths.figures = fullfile(cfg.paths.results, 'figures');
    cfg.paths.stats = fullfile(cfg.paths.results, 'stats');
    cfg.paths.scripts = fullfile(cfg.paths.project_root, 'scripts');
    cfg.paths.functions = fullfile(cfg.paths.project_root, 'functions');
    
    % Path to FieldTrip toolbox (modify this to your installation)
    cfg.paths.fieldtrip = '/path/to/fieldtrip';
    
    % ======================================================================
    % DATA ACQUISITION PARAMETERS
    % ======================================================================
    cfg.data.sampling_rate = 1000; % Hz
    cfg.data.file_format = 'neuralynx_ncs'; % Options: 'neuralynx_ncs', 'plexon_nex', 'blackrock_nev', etc.
    
    % ======================================================================
    % PREPROCESSING PARAMETERS
    % ======================================================================
    % Filtering
    cfg.preproc.filter.enabled = true;
    cfg.preproc.filter.type = 'but'; % Butterworth filter
    cfg.preproc.filter.lowpass = 300; % Hz (LFP upper bound)
    cfg.preproc.filter.highpass = 1; % Hz (to remove slow drifts)
    cfg.preproc.filter.order = 4;
    
    % Detrending
    cfg.preproc.detrend = true;
    
    % Artifact rejection
    cfg.preproc.artifact.enabled = true;
    cfg.preproc.artifact.threshold = 5; % standard deviations
    
    % Re-referencing
    cfg.preproc.reref.enabled = false;
    cfg.preproc.reref.method = 'avg'; % 'avg' or 'common'
    
    % ======================================================================
    % SPECTRAL ANALYSIS PARAMETERS
    % ======================================================================
    % Time-frequency analysis
    cfg.analysis.timefreq.method = 'mtmconvol'; % 'mtmconvol', 'wavelet', 'mtmfft'
    cfg.analysis.timefreq.foi = 1:1:100; % Frequencies of interest (Hz)
    cfg.analysis.timefreq.toi = -1:0.05:2; % Time of interest (s)
    cfg.analysis.timefreq.t_ftimwin = 5./cfg.analysis.timefreq.foi; % Time window length
    cfg.analysis.timefreq.taper = 'hanning';
    
    % Power spectral density
    cfg.analysis.psd.method = 'mtmfft';
    cfg.analysis.psd.taper = 'dpss';
    cfg.analysis.psd.tapsmofrq = 2; % Frequency smoothing
    cfg.analysis.psd.foilim = [1 100]; % Frequency limits
    
    % Coherence analysis
    cfg.analysis.coherence.method = 'mtmfft';
    cfg.analysis.coherence.taper = 'dpss';
    cfg.analysis.coherence.tapsmofrq = 2;
    
    % ======================================================================
    % EVENT-RELATED ANALYSIS
    % ======================================================================
    cfg.events.prestim = 1; % Pre-stimulus time (s)
    cfg.events.poststim = 2; % Post-stimulus time (s)
    cfg.events.baseline = [-0.5 0]; % Baseline period (s)
    
    % ======================================================================
    % VISUALIZATION PARAMETERS
    % ======================================================================
    cfg.plot.save_figures = true;
    cfg.plot.figure_format = 'png'; % 'png', 'jpg', 'fig', 'eps'
    cfg.plot.resolution = 300; % DPI
    cfg.plot.colormap = 'jet';
    
    % ======================================================================
    % STATISTICAL PARAMETERS
    % ======================================================================
    cfg.stats.alpha = 0.05; % Significance level
    cfg.stats.method = 'montecarlo'; % Statistical method
    cfg.stats.numrandomization = 1000; % Number of permutations
    
    fprintf('Configuration loaded successfully.\n');
end
