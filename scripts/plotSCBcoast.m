%
% plotSCBcoast(xylims)
% eg. plotSCBcoast([-122.5 -121.7 36.5 37.1])
%     plotSCBcoast([-122.5 -121.7 36.5 37.1],'westcoastLL.mat')
%
% adapted from Jnaneshwar Das
%
function plotSCBcoast(xylims, mat_coast)

% lon_NOAA_coastwatch = mod(360+lon,360)
if nargin < 2
    mat_coast = '../data/westcoastLL.mat';
end

wc = load(mat_coast);
line(wc.LON,wc.LAT,'color','k','LineWidth',2)

if nargin == 0
   xylims = [-118.8 -117.7 33.25 34.13333];
end
xylims = [xylims(1) xylims(2) xylims(3) xylims(4)];

axis(xylims)

% add scalebar at bottom left of figure
drawScaleBar( xylims(3)+0.01, xylims(1)+0.03 );

end