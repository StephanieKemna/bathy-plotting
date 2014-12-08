%
% function [] = threeDPlot(data_x, data_y, data_z, area, caxis_range, cm)
% to produce a 3D surface plot, given data for certain area, and color axis
% preferences
%   data_x/y/z should be the x, y, z values, reshaped using the lon/lat
%              grid
%   area should be a string defining the area to be plotted (used for
%        figure title)
%   caxis_range defines the min/max values for caxis
%   cm defines the colormap (optional)
%
% Stephanie Kemna, RESL Lab, University of Southern California
% last updated: 7 December 2014, 5pm
%
% tested with MatlabR2012a on Ubuntu 14.04
%
function [] = threeDPlot(data_x, data_y, data_z, area, caxis_range, cm)

%% prepare figure
figure('Position',[0 0 1200 1200])

%% 3D plot
surfc( data_x, data_y, data_z );

%% prettify
shading interp;
lighting phong;
camlight;
if nargin > 3
    colormap(cm);
end
caxis(caxis_range);

%% finish figure
title(['Bathymetry for ' area]);
xlabel('longitude')
ylabel('latitude')
zlabel('relative height (m)')
set(gca,'FontSize',16);
set(findall(gcf,'type','text'),'FontSize',16);

end