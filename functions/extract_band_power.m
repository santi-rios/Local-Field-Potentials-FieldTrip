% Utility Function: Extract Frequency Band Power
% Extracts power in specific frequency bands from LFP data
%
% Usage:
%   band_power = extract_band_power(freq_data, band_name)
%
% Inputs:
%   freq_data - FieldTrip frequency structure from ft_freqanalysis
%   band_name - String specifying the band: 'delta', 'theta', 'alpha', 
%               'beta', 'gamma', or custom [low high] range
%
% Output:
%   band_power - Power in the specified frequency band
%
% Author: LFP Analysis Pipeline
% Date: 2026

function band_power = extract_band_power(freq_data, band_name)
    % Define standard frequency bands
    bands = struct();
    bands.delta = [1 4];      % Delta: 1-4 Hz
    bands.theta = [4 8];      % Theta: 4-8 Hz
    bands.alpha = [8 13];     % Alpha: 8-13 Hz
    bands.beta = [13 30];     % Beta: 13-30 Hz
    bands.gamma = [30 100];   % Gamma: 30-100 Hz
    bands.lowgamma = [30 50]; % Low Gamma: 30-50 Hz
    bands.highgamma = [50 100]; % High Gamma: 50-100 Hz
    
    % Get frequency range
    if ischar(band_name)
        if isfield(bands, band_name)
            freq_range = bands.(band_name);
        else
            error('Unknown frequency band: %s', band_name);
        end
    elseif isnumeric(band_name) && length(band_name) == 2
        freq_range = band_name;
    else
        error('Invalid band specification. Use band name or [low high] range.');
    end
    
    % Find frequencies within the band
    freq_idx = freq_data.freq >= freq_range(1) & freq_data.freq <= freq_range(2);
    
    if sum(freq_idx) == 0
        error('No frequencies found in range [%d %d] Hz', freq_range(1), freq_range(2));
    end
    
    % Extract power in the band (average across frequencies)
    if isfield(freq_data, 'powspctrm')
        band_power = mean(freq_data.powspctrm(:, freq_idx), 2);
    else
        error('No power spectrum found in data structure.');
    end
    
    fprintf('Extracted %s band power ([%d-%d] Hz)\n', ...
        band_name, freq_range(1), freq_range(2));
end
