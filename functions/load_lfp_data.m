% Utility Function: Load LFP Data
% Loads LFP data from various formats and converts to FieldTrip structure
%
% Usage:
%   data = load_lfp_data(filename, format)
%
% Inputs:
%   filename - Full path to data file
%   format   - Data format: 'neuralynx_ncs', 'plexon_nex', 'blackrock_nev', etc.
%
% Output:
%   data - FieldTrip data structure
%
% Author: LFP Analysis Pipeline
% Date: 2026

function data = load_lfp_data(filename, format)
    % Check if file exists
    if ~exist(filename, 'file')
        error('File not found: %s', filename);
    end
    
    % Load data based on format
    fprintf('Loading data from: %s\n', filename);
    fprintf('Format: %s\n', format);
    
    cfg = [];
    cfg.dataset = filename;
    
    switch lower(format)
        case 'neuralynx_ncs'
            cfg.dataformat = 'neuralynx_ncs';
            cfg.headerformat = 'neuralynx_ncs';
            
        case 'plexon_nex'
            cfg.dataformat = 'plexon_nex';
            cfg.headerformat = 'plexon_nex';
            
        case 'blackrock_nev'
            cfg.dataformat = 'blackrock_nev';
            cfg.headerformat = 'blackrock_nev';
            
        case 'matlab'
            % Load MATLAB .mat file
            loaded = load(filename);
            fields = fieldnames(loaded);
            data = loaded.(fields{1});
            return;
            
        otherwise
            error('Unsupported data format: %s', format);
    end
    
    % Use FieldTrip to read the data
    data = ft_preprocessing(cfg);
    
    fprintf('Data loaded successfully.\n');
    fprintf('  Number of channels: %d\n', length(data.label));
    fprintf('  Sampling rate: %.1f Hz\n', data.fsample);
    fprintf('  Duration: %.2f s\n', (length(data.time{1}) / data.fsample));
end
