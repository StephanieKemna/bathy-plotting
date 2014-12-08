%
% drawScaleBar(lat,lon)
%
% adapted from Jnaneshwar Das
%
function drawScaleBar(lat,lon)

hold on;

% add scalebar at bottom left of figure
plot([lon (lon+km2deg(10))]', [lat lat]','k+-','LineWidth',1.2)
text((lon+km2deg(3)),lat+0.02,'10 km','FontSize',15,'fontWeight','bold')

end

function deg = km2deg(km)
    deg = km/111.12;
end