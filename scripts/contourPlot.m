%
% function [] = contourPlot(data_x, data_y, data_z, maxDepth, maxHeight, contour_interval)
% to produce a contour plot, given data and color axis limits
%   data_x/y/z should be the x, y, z values, reshaped using the lon/lat
%              grid
%   maxDepth and minHeight are integers to give limits for color axis
%
% Stephanie Kemna, RESL Lab, University of Southern California
% last updated: 7 December 2014, 5pm
%
% tested with MatlabR2012a on Ubuntu 14.04
%
function [] = contourPlot(data_x, data_y, data_z, maxDepth, maxHeight, region, contour_interval)

if nargin < 7
    contour_interval = -1;
end

%% prepare figure
figure('Position',[0 0 1200 1200])

%% decide on range of contour lines, or number of contour lines
% e.g. c_lines = minZ:interval:0;  or  c_lines = 100;
minZ = min(min(data_z));
% start from 'logical' minimum
minZ = minZ - mod(minZ,100);    

% determine contour interval
if (minZ <= -3000)
    interval = 300;
elseif (minZ <= -2000)
    interval = 200;
elseif (minZ <= -500)
    interval = 100;
else
    interval = 10;
end
% overwrite range by parameter, if one was given
if (contour_interval > -1)
    interval = contour_interval;
end
% set param c_lines to range (can be replaced by int)
c_lines = floor(minZ:interval:0);

%% plot the depth/height contour lines
[C,h] = contour( data_x, data_y, data_z, c_lines);

%% finish figure

% plot coastline
plotSCBcoast(region);

% legend etc
c = colorbar;
set(get(c,'Title'),'String','Depth');
caxis([maxDepth maxHeight]);
title('Bathymetry');
xlabel('longitude');
ylabel('latitude');
set(gca,'FontSize',16);
set(findall(gcf,'type','text'),'FontSize',16);
axis equal;
% contour labels
text_handle = clabel(C,h,'LabelSpacing',288);
set(text_handle,'BackgroundColor',[1 1 1],'Edgecolor',[.7 .7 .7],'Rotation',0)

end