%
% function [newbathy] = getBathySubset( bathy, [lonMin lonMax latMin latMax] )
%
% Stephanie Kemna, RESL Lab, University of Southern California
% last updated: 19 June 2013
%
function [newbathy] = getBathySubset( bathy, latlon )

cnt = 0;
for idx = 1:size(bathy,1)
    % bathy(idx,1): lon, bathy(idx,2): lat, bathy(idx,3): relative height
    % check if within desired range
    if ( bathy(idx,1) > latlon(1) && bathy(idx,1) < latlon(2) && ...
            bathy(idx,2) > latlon(3) && bathy(idx,2) < latlon(4) )
        cnt = cnt + 1;
        newbathy(cnt,:) = bathy(idx,:);
    end
end

end