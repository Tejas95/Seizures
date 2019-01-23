function [vrms, t] = FeatureTimeRms(x, iBlockLength, iHopLength, f_s, numberofchannels)

    % number of results
    iNumOfBlocks    = ceil (length(x)/iHopLength);
    
    % compute time stamps
    t               = ((0:iNumOfBlocks-1) * iHopLength + (iBlockLength/2))/f_s;
    
    % allocate memory
    vrms            = zeros(numberofchannels,iNumOfBlocks);

    for m = 1:numberofchannels
        for n = 1:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(x),i_start + iBlockLength - 1);
        
            % calculate the rms
            vrms(m,n)     = sqrt(mean(x(m, i_start:i_stop).^2));
        end
    end
 
    % convert to dB
    epsilon         = 1e-5; %-100dB
    
    vrms(vrms < epsilon)    = epsilon;
    vrms                    = 20*log10(vrms);
end