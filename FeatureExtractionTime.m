for i = 1:numberofchannels
    
    %Input Normalization 
    if (length(afAudioData)> 1)
        afAudioData(i,:) = afAudioData(i,:)/max(abs(afAudioData(i,:)));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ZERO CROSSINGS

%zcd = dsp.ZeroCrossingDetector;

%ZeroCrossings = zcd(AfAudioData); %Number of zero crossings per channels

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FEATURE TIME RMS

%[vrms, T] = FeatureTimeRms(afAudioData, iBlockLength, iHopLength, f_s, numberofchannels);

%Vrms = transpose(vrms);
%{
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
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%LINE LENGTH

%[linelength_mean,linelength_std] = LineLength(afAudioData, numberofchannels, iHopLength, iBlockLength, iNumOfBlocks);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
%MINIMA AND MAXIMA

%Maxima_Mean = zeros(numberofchannels,iNumOfBlocks);

for i = 1 : numberofchannels
    for n = 1:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
 
            %Maxima_Mean(i,n) = mean(findpeaks(afAudioData(i,i_start:i_stop)));
            Maxima_Std(i,n) = std(findpeaks(afAudioData(i,i_start:i_stop)));
    end
end
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%MEAN NONLINEAR ENERGY
    
    [NonLinearEnergy_Mean, NonLinearEnergy_Std] = MeanNonLinearEnergy(afAudioData, numberofchannels, iHopLength, iBlockLength, iNumOfBlocks);
    %NonLinearEnergy_transpose = transpose(NonLinearEnergy);
    %NonLinearEnergy_Mean = mean(NonLinearEnergy_transpose);
    %NonLinearEnergy_Std = std(NonLinearEnergy_transpose);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
