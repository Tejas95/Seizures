
for i = 1:numberofchannels
    
    %Input Normalization 
    if (length(afAudioData)> 1)
        afAudioData(i,:) = afAudioData(i,:)/max(abs(afAudioData(i,:)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Feature Time RMS

[vrms, T] = FeatureTimeRms(afAudioData, iBlockLength, iHopLength, f_s, numberofchannels);

Vrms = transpose(vrms);

%Feature Time RMS Mean
vrms_mean = mean(Vrms);

%Feature Time RMS Standard Deviation
for i = 1:numberofchannels
    for j = 1: length(Vrms)
        vrms_std(j,i) = Vrms(j,i)-mean(i);
    end
end

Vrms_std = mean(vrms_std.^2);
Vrms_Std = Vrms_std.^0.5; %Final Standard Deviation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AfAudioData = transpose(afAudioData);

%Feature Spectral Centroid
for j = 1:numberofchannels
    [X,f,t] = spectrogram([AfAudioData(:,j); zeros(iBlockLength,1)], afWindow, iBlockLength-iHopLength, iBlockLength, f_s);
    X = abs(X)*2/iBlockLength;
    sc(j) = FeatureSpectralCentroid (X(:,j), f_s);
    SC = transpose(sc);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%