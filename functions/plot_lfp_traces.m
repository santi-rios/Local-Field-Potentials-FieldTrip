% Utility Function: Plot LFP Traces
% Creates publication-quality plots of LFP traces
%
% Usage:
%   plot_lfp_traces(data, channels, time_range, save_path)
%
% Inputs:
%   data       - FieldTrip data structure
%   channels   - Cell array of channel names or indices to plot
%   time_range - [start end] time range in seconds (optional)
%   save_path  - Path to save figure (optional)
%
% Author: LFP Analysis Pipeline
% Date: 2026

function plot_lfp_traces(data, channels, time_range, save_path)
    % Default parameters
    if nargin < 3 || isempty(time_range)
        time_range = [data.time{1}(1), data.time{1}(end)];
    end
    if nargin < 4
        save_path = [];
    end
    
    % Get channel indices
    if iscell(channels)
        chan_idx = [];
        for i = 1:length(channels)
            idx = find(strcmp(data.label, channels{i}));
            if ~isempty(idx)
                chan_idx = [chan_idx; idx];
            end
        end
    else
        chan_idx = channels;
    end
    
    if isempty(chan_idx)
        error('No valid channels found.');
    end
    
    % Find time indices
    time_idx = data.time{1} >= time_range(1) & data.time{1} <= time_range(2);
    
    % Create figure
    figure('Name', 'LFP Traces', 'Position', [100 100 1200 800]);
    
    n_channels = length(chan_idx);
    
    for i = 1:n_channels
        subplot(n_channels, 1, i);
        
        % Plot trace
        plot(data.time{1}(time_idx), data.trial{1}(chan_idx(i), time_idx), 'k', 'LineWidth', 1);
        
        % Labels and formatting
        ylabel(data.label{chan_idx(i)}, 'FontSize', 10);
        if i == n_channels
            xlabel('Time (s)', 'FontSize', 12);
        else
            set(gca, 'XTickLabel', []);
        end
        
        grid on;
        box off;
    end
    
    % Overall title
    sgtitle('LFP Traces', 'FontSize', 14, 'FontWeight', 'bold');
    
    % Save figure if path provided
    if ~isempty(save_path)
        saveas(gcf, save_path);
        fprintf('Figure saved to: %s\n', save_path);
    end
end
