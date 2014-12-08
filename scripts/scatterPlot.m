%
% function [] = scatterPlot(data, region, maxDepth, maxHeight)
% to produce a scatter plot, given data and color axis limits
%   data should be matrix, with 3 columns (x, y, z)
%   region: [lonMin lonMax latMin latMax]
%   maxDepth and minHeight are integers to give limits for color axis
%
% Stephanie Kemna, RESL Lab, University of Southern California
% last updated: 7 December 2014, 5pm
%
% tested with MatlabR2012a on Ubuntu 14.04
%
function [] = scatterPlot(data, region, maxDepth, maxHeight)

% prepare figure
figure('Position',[0 0 1200 1200])

% scatter plot, size 5, color = 3rd dimension, depth
scatter(data(:,1),data(:,2),5,data(:,3));

% add Southern California coastline
hold on;
plotSCBcoast(region);

% finish figure
c = colorbar;
set(get(c,'Title'),'String','Depth');
caxis([maxDepth maxHeight]);
title('Bathymetry');
xlabel('longitude');
ylabel('latitude');
set(gca,'FontSize',16);
set(findall(gcf,'type','text'),'FontSize',16);
axis equal;

end