function [NonLinearEnergy_Mean, NonLinearEnergy_Std] = MeanNonLinearEnergy(afAudioData, numberofchannels, iHopLength, iBlockLength, iNumOfBlocks)

for i = 1 : numberofchannels
    %for k = 2:length1-1
        for n = 2:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
            
            %NonLinearEnergy(i,k) = (afAudioData(i,i_start:i_stop))^2 - (afAudioData(i,k-1)*afAudioData(i,k+1));
            NonLinearEnergy1_mean(i,n-1) = mean(afAudioData(i,i_start:i_stop).^2);
            NonLinearEnergy1_std(i,n-1) = std(afAudioData(i,i_start:i_stop).^2);
            
        
        end
        for n = 1:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
            NonLinearEnergy2_mean(i,n) = mean(afAudioData(i,i_start:i_stop));
            NonLinearEnergy2_std(i,n) = std(afAudioData(i,i_start:i_stop));
        end
        
        for n = 3:iNumOfBlocks
            i_start     = (n-1)*iHopLength + 1;
            i_stop      = min(length(afAudioData),i_start + iBlockLength - 1);
            NonLinearEnergy3_mean(i,n-2) = mean(afAudioData(i,i_start:i_stop));
            NonLinearEnergy3_std(i,n-2) = std(afAudioData(i,i_start:i_stop));
        end
end
NonLinearEnergy1_mean(:,iNumOfBlocks) = 0;
NonLinearEnergy3_mean(:,iNumOfBlocks) = 0;
NonLinearEnergy3_mean(:,iNumOfBlocks-1) = 0;

NonLinearEnergy1_std(:,iNumOfBlocks) = 0;
NonLinearEnergy3_std(:,iNumOfBlocks) = 0;
NonLinearEnergy3_std(:,iNumOfBlocks-1) = 0;

NonLinearEnergy_Mean = NonLinearEnergy1_mean - (NonLinearEnergy2_mean .* NonLinearEnergy3_mean);
NonLinearEnergy_Std = NonLinearEnergy1_std - (NonLinearEnergy2_std .* NonLinearEnergy3_std);
end