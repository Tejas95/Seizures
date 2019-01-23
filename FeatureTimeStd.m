function [vstd, t] = FeatureTimeStd(x, iBlockLength, iHopLength, f_s, numberofchannels)

    % number of results
    iNumOfBlocks    = ceil (length(x)/iHopLength);
    
    % compute time stamps
    t               = ((0:iNumOfBlocks-1) * iHopLength + (iBlockLength/2))/f_s;
    
    % allocate memory
    vstd            = zeros(numberofchannels,iNumOfBlocks);
    
    for m = 1:numberofchannels
        for n = 1:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(x),i_start + iBlockLength - 1);
        
            % calculate the standard deviation
            vstd(m,n)     = std(x(m, i_start:i_stop));
        end
    end
end