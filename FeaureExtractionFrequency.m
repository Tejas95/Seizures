
for i = 1:numberofchannels
    
    %Input Normalization 
    if (length(afAudioData)> 1)
        afAudioData(i,:) = afAudioData(i,:)/max(abs(afAudioData(i,:)));
    end
end

for j = 1:numberofchannels
    [X,f,t] = spectrogram([AfAudioData(:,j); zeros(iBlockLength,1)], afWindow, iBlockLength-iHopLength, iBlockLength, f_s);
    X = abs(X)*2/iBlockLength;
     
    %X_mean(j,:) = mean(X);
    %X_std(j,:) = std(X);      
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
%BANDWIDTH

for i = 1 : numberofchannels
 
    Bandwidth_Mean(i,:) = max(X_mean(i,:)) - min(X_mean(i,:));
    Bandwidth_Std(i,:) = max(X_std(i,:)) - min(X_std(i,:));
                            
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PEAK FREQUENCY

for i = 1 : numberofchannels
 
    Peak_Mean(i,:) = max(X_mean(i,:));
    Peak_Std(i,:) = max(X_std(i,:));
                            
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PEAK POWER

for i = 1:numberofchannels
    for n = 1:iNumOfBlocks
        
        i_start     = (n-1)*iHopLength + 1;
        i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
        
        
        Peakpower(i,n) = bandpower(afAudioData(i,i_start:i_stop));
        PeakPower = transpose(Peakpower);
        
        
    end
    
    %PeakPower_mean = mean(PeakPower);
    %PeakPower_std(:,i) = std(PeakPower);
    %{
    for j = 1 : 16
        
            PeakPower_Mean(j,1) = PeakPower_mean(j,16);
            PeakPower_Std(j,1) = PeakPower_std(j,16);
    end
    %}
end
PeakPower_Mean = mean(PeakPower);
PeakPower_Std = std(PeakPower);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FEATURE SPECTRAL CENTROID


%{
for j = 1:numberofchannels
    [X,f,t] = spectrogram([AfAudioData(:,j); zeros(iBlockLength,1)], afWindow, iBlockLength-iHopLength, iBlockLength, f_s);
    X = abs(X)*2/iBlockLength;
     
    X_mean(j,:) = mean(X);
    X_std(j,:) = std(X);      
end
%}

sc = FeatureSpectralCentroid (X, f_s, numberofchannels);
%SC_Mean = transpose(sc_mean);

%sc_std = FeatureSpectralCentroid (X_std, f_s, numberofchannels);
%SC_Std = transpose(sc_std);
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%