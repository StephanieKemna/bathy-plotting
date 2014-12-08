%
% function [] = plotBathyLA(subset, maxDepth, maxHeight, file)
%   Available subsets: 'LA' (all), 'Santa Monica', 'San Pedro'
%   maxDepth/maxHeight: to specify range shown in 2D bathy plot
%   file: to specify the filename for the bathymetry file
%
% This function will provide three plots:
% 1. Bathy birds-eye view, color range limited as defined in the function
% 2. Bathy contours birds-eye view
% 3. 3-D surface plot (with contours underneath)
%
% Nb. This may take a while to run.. loading/cropping data is intensive.
%
% This function requires the following matlab files:
% * bathy_la.xyz
% * getBathySubset.m
% * mycolormap.mat
% * plotSCBcoast.m (which requires westcoastLL.mat and drawScaleBar.m)
%
% Stephanie Kemna, RESL Lab, University of Southern California
% last updated: 7 December 2014, 5pm
%
% tested with MatlabR2012a on Ubuntu 14.04
%
function [] = plotBathyLA(subset, maxDepth, maxHeight, bathy_file)

%% read input arguments
if nargin < 1
    subset = 'LA';
    disp('No function parameters given, plotting all LA bathy.');
end
if nargin < 2
    % specify depth/height limits for colorbar 2D bathy plot
    maxDepth = -100;
end
if nargin < 3
    maxHeight = 0;
end
if nargin < 4
    bathy_file = '../data/bathy_la.xyz';
end
mycolormap = load('../colormaps/la_bathy.mat');

%% specify region of interest, get subset of the data from SCCOOS
if ( strcmp(subset,'LA') == 1 )
    region = [-118.8 -117.7 33.25 34.13333];
    la = load(bathy_file);
    bathy_data = la;
    cm = mycolormap.la;
    cx = [-800 300];
    area = 'Los Angeles';
elseif ( strcmp(subset,'Santa Monica') == 1 )
    % Santa Monica Bay [lonMin lonMax latMin latMax]
    region = [-118.821683 -118.324929 33.719051 34.046760];
    smb_bathy = '../data/bathy_smb.mat'; 
    if (exist(smb_bathy,'file') ~= 2)
        disp('Creating bathy_smb.mat - this should only be needed once, but may take a while');
        la = load(bathy_file);
        bathy_data = getBathySubset(la,region);
        save(smb_bathy,'bathy_data');
    else
        disp(['Loading ' smb_bathy '...']);
        load(smb_bathy);
    end
    cm = mycolormap.sm;
    cx = [min(bathy_data(:,3)),max(bathy_data(:,3))]; % caxis can stay as is for saved colormap
    area = 'Santa Monica Bay';
elseif ( strcmp(subset,'San Pedro') == 1 )
    % San Pedro Bay
    region = [-118.315935896254 -117.840935896254 33.50907206091 33.78407206091];    
    spb_bathy = '../data/bathy_spb.mat';
    if (exist(spb_bathy,'file') ~= 2)
        disp('Creating bathy_spb.mat - this should only be needed once, but may take a while');
        la = load(bathy_file);
        bathy_data = getBathySubset(la,region);
        save(spb_bathy,'bathy_data');
    else
        disp(['Loading ' spb_bathy '...']);
        load(spb_bathy);
    end
    cm = mycolormap.sp;
    cx = [-400 200]; % change caxis for saved colormap
    area = 'San Pedro Bay';
end

%% 2D bathy plot
scatterPlot(bathy_data, region, maxDepth, maxHeight);

%% determine grid size
unique_lon = unique(bathy_data(:,1));
lon_grid = size(unique_lon,1);
unique_lat = unique(bathy_data(:,2));
lat_grid = size(unique_lat,1);
reshaped_x = reshape(bathy_data(:,1),lon_grid,lat_grid);
reshaped_y = reshape(bathy_data(:,2),lon_grid,lat_grid);
reshaped_z = reshape(bathy_data(:,3),lon_grid,lat_grid);

%% contour plot
contourPlot(reshaped_x, reshaped_y, reshaped_z, maxDepth, maxHeight, region);

%% 3D surface plot (with contours)
threeDPlot(reshaped_x, reshaped_y, reshaped_z, area, cx, cm);

end