% Initialize LFP Analysis Pipeline
% This script sets up the MATLAB environment for LFP analysis using FieldTrip
%
% Usage:
%   Run this script at the beginning of each analysis session
%   >> init_pipeline
%
% Author: LFP Analysis Pipeline
% Date: 2026

function init_pipeline()
    % Get the project root directory
    [project_root, ~, ~] = fileparts(mfilename('fullpath'));
    
    fprintf('========================================\n');
    fprintf('LFP Analysis Pipeline Initialization\n');
    fprintf('========================================\n\n');
    
    % Add project directories to MATLAB path
    fprintf('Adding project directories to path...\n');
    addpath(genpath(fullfile(project_root, 'scripts')));
    addpath(genpath(fullfile(project_root, 'functions')));
    addpath(genpath(fullfile(project_root, 'config')));
    
    % Check if FieldTrip is available
    fprintf('Checking for FieldTrip toolbox...\n');
    
    % Try to load configuration to get FieldTrip path
    config_file = fullfile(project_root, 'config', 'config.m');
    if exist(config_file, 'file')
        cfg = config();
        ft_path = cfg.paths.fieldtrip;
    else
        % Use template configuration
        warning('config.m not found. Using template configuration.');
        fprintf('Please copy config_template.m to config.m and update paths.\n');
        cfg = config_template();
        ft_path = cfg.paths.fieldtrip;
    end
    
    % Add FieldTrip to path if it exists
    if exist(ft_path, 'dir')
        addpath(ft_path);
        ft_defaults;
        fprintf('FieldTrip loaded successfully from: %s\n', ft_path);
    else
        warning('FieldTrip not found at: %s', ft_path);
        fprintf('Please install FieldTrip and update the path in config.m\n');
        fprintf('Download from: https://www.fieldtriptoolbox.org/download/\n');
    end
    
    % Create necessary directories if they don't exist
    fprintf('\nCreating/verifying directory structure...\n');
    dirs_to_create = {
        fullfile(project_root, 'data', 'raw')
        fullfile(project_root, 'data', 'processed')
        fullfile(project_root, 'results', 'figures')
        fullfile(project_root, 'results', 'stats')
    };
    
    for i = 1:length(dirs_to_create)
        if ~exist(dirs_to_create{i}, 'dir')
            mkdir(dirs_to_create{i});
            fprintf('  Created: %s\n', dirs_to_create{i});
        end
    end
    
    fprintf('\n========================================\n');
    fprintf('Initialization complete!\n');
    fprintf('========================================\n\n');
    fprintf('Next steps:\n');
    fprintf('1. Place your raw data files in: %s\n', fullfile(project_root, 'data', 'raw'));
    fprintf('2. Update configuration in: %s\n', fullfile(project_root, 'config', 'config.m'));
    fprintf('3. Run preprocessing: run_preprocessing.m\n');
    fprintf('4. Run analysis: run_analysis.m\n\n');
end
