%NORMALIZED DATA
%{
Bandwidth_Mean_N = transpose(normalize(Bandwidth_Mean,'range'));
Bandwidth_Std_N = transpose(normalize(Bandwidth_Std,'range'));

linelength_mean_N = transpose(normalize(linelength_mean,'range'));
linelength_std_N = transpose(normalize(linelength_std,'range'));

Maxima_Mean_N = transpose(normalize(Maxima_Mean,'range'));
Maxima_Std_N = transpose(normalize(Maxima_Std,'range'));

NonLinearEnergy_Mean_N = normalize(NonLinearEnergy_Mean,'range');
NonLinearEnergy_Std_N = normalize(NonLinearEnergy_Std,'range');

Peak_Mean_N = transpose(normalize(Peak_Mean,'range'));
Peak_Std_N = transpose(normalize(Peak_Std,'range'));

PeakPower_Mean_N = transpose(normalize(PeakPower_Mean, 'range'));
PeakPower_Std_N = transpose(normalize(PeakPower_Std, 'range'));

SC_Mean_N = transpose(normalize(SC_Mean, 'range'));
SC_Std_N = transpose(normalize(SC_Std, 'range'));

%Vrms_N_I = normalize(Vrms,'range');
Vrms_N_P = normalize(Vrms,'range');
%Vrms_N_test = normalize(Vrms,'range');

ZeroCrossings_N = normalize(ZeroCrossings, 'range');
%}

%Vrms_N_I = normalize(Vrms,'range');
%Vrms_N_P = normalize(Vrms,'range');
%Vrms_N_test = normalize(Vrms,'range');

%SC_N_I = transpose(normalize(sc, 'range'));
%ZeroCrossings_N = normalize(ZeroCrossings, 'range');

%Maxima_Mean_N = transpose(normalize(Maxima_Mean,'range'));
%Maxima_Std_N = transpose(normalize(Maxima_Std,'range'));

%linelength_mean_N = transpose(normalize(linelength_mean,'range'));
%linelength_std_N = transpose(normalize(linelength_std,'range'));

NonLinearEnergy_Mean_N = transpose(normalize(NonLinearEnergy_Mean,'range'));
%NonLinearEnergy_Std_N = transpose(normalize(NonLinearEnergy_Std,'range'));
