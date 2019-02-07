function [LL_mean,LL_std] = LineLength(afAudioData, numberofchannels, iHopLength, iBlockLength, iNumOfBlocks)

%LL = zeros(numberofchannels,iNumOfBlocks);

for m = 1 : numberofchannels
    for n = 1 : iNumOfBlocks
       i_start     = (n-1)*iHopLength + 1;
       i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
       
       %for j = i_start + 1 : i_stop
           LLmean_1(m,n) = mean(afAudioData(m,i_start:i_stop));
           LLstd_1(m,n) = std(afAudioData(m,i_start:i_stop));
       %end
    end
    
    for p = 2 : iNumOfBlocks
        i_start     = (p-1)*iHopLength + 1;
        i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
        LLmean_2(m,p-1) = mean(afAudioData(m,i_start:i_stop));
        LLstd_2(m,p-1) = std(afAudioData(m,i_start:i_stop));
    end
end
LLmean_2(:,iNumOfBlocks) = 0;
LLstd_2(:,iNumOfBlocks) = 0;
LL_mean = 0;
LL_std = 0;
LL_mean = LL_mean + abs(LLmean_1 - LLmean_2);
LL_std = LL_std + abs(LLstd_1 - LLstd_2);
end