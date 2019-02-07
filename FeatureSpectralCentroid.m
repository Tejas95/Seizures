%function [vsc] = FeatureSpectralCentroid (X, f_s, numberofchannels)
    X       = X.^2;
    x = X;
    
    for m = 1:numberofchannels
        for n = 1:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(X),i_start + iBlockLength - 1);
            for i = i_start:i_stop
                vsc(n,m) = (i_start*x(:,m))./sum(x(:,m));
          
        %vsc(:,m)     = ([0:size(x,1)-1]*x(:,m))./sum(x(:,m));
            
          %  for i = i_start:i_stop
                %vsc(n,m) = (x(:,m)*x(:,m))./sum(x(:,m));
          %  end
        
            end
        end
    end
        
    % avoid NaN for silence frames
    vsc (sum(x,1) == 0) = 0;
        
    % convert from index to Hz
    vsc     = vsc / size(x,1) * f_s/2;
%end