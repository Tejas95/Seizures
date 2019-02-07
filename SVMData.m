
Classes(1:22479,1) = 'I';
Classes(22479:44958,1) = 'P';
%Classes(1,1) = 'I';
%Classes(2,1) = 'P';
%P1_Classes(1:105469,1) = 'I';
%P1_Classes(105469:210938,1) = 'P';

%Classes_test(1:937,1) = 'P';
%SPECTRALCENTROID_MEAN_DATA = array2table(SpectralCentroid_MEAN);
%SPECTRALCENTROID_MEAN_DATA.Group = Classes;


%RMS_Interictal = Vrms_N_I; 
%RMS_Preictal = Vrms_N_P;
%RMS_Preictal_Interictal_AllSegments_24_48 = Vrms_N_test;

%ZC_Interictal = ZeroCrossings_N;
%ZC_Preictal = ZeroCrossings_N;
%SC_Interictal = SC_N_I; 
%RMS_MEAN_SPECTRALCENTROID_MEAN = [Feature_Time_RMS_Mean;SpectralCentroid_MEAN];

%RMS = vertcat(RMS_Interictal, RMS_Preictal);
%RMS_Data = array2table(RMS);
%RMS_Data.Group = Classes;

%RMS_Preictal_Interictal_AllSegments_Data_24_48 = array2table(RMS_Preictal_Interictal_AllSegments_24_48);
%RMS_Test_Data.Group = Classes_test

%RMS = Vrms_N_test;
%RMS_Data = array2table(RMS);

%ZC = vertcat(ZC_Interictal, ZC_Preictal);
%ZC_Data = array2table(ZC);
%ZC_Data.Group = Classes;

%MaximaStd_Interictal = Maxima_Std_N;
%MaximaStd_Preictal = Maxima_Std_N;

%MaximaStd = vertcat(MaximaStd_Interictal, MaximaStd_Preictal);
%MaximaStd = Maxima_Std_N;
%MaximaStd_Data = array2table(MaximaStd);
%MaximaStd_Data.Group = Classes;

%LineLengthMean_Interictal = linelength_mean_N;
%LineLengthStd_Interictal = linelength_std_N;
%LineLengthMean_Preictal = linelength_mean_N;
%LineLengthStd_Preictal = linelength_std_N;

%LineLengthMean = vertcat(LineLengthMean_Interictal, LineLengthMean_Preictal);
%LineLengthMean_Data = array2table(LineLengthMean);
%LineLengthMean_Data.Group = Classes;

%LineLengthStd = vertcat(LineLengthStd_Interictal, LineLengthStd_Preictal);
%LineLengthStd_Data = array2table(LineLengthStd);
%LineLengthStd_Data.Group = Classes;

%NonLinearEnergyMean_Interictal = NonLinearEnergy_Mean_N;
%NonLinearEnergyStd_Interictal = NonLinearEnergy_Std_N;

%NonLinearEnergyMean_Preictal = NonLinearEnergy_Mean_N;
%NonLinearEnergyStd_Preictal = NonLinearEnergy_Std_N;

%NonLinearEnergyMean = vertcat(NonLinearEnergyMean_Interictal, NonLinearEnergyMean_Preictal);
%NonLinearEnergyMean_Data = array2table(NonLinearEnergyMean);
%NonLinearEnergyMean_Data.Group = Classes;

%NonLinearEnergyStd = vertcat(NonLinearEnergyStd_Interictal, NonLinearEnergyStd_Preictal);
%NonLinearEnergyStd_Data = array2table(NonLinearEnergyStd);
%NonLinearEnergyStd_Data.Group = Classes;

NonLinearEnergyMean = NonLinearEnergy_Mean_N;
NonLinearEnergyMean_Data = array2table(NonLinearEnergyMean);