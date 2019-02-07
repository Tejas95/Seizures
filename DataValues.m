%interictal_allsegments = horzcat(interictal_segment_1.data,interictal_segment_2.data,interictal_segment_3.data,interictal_segment_4.data,interictal_segment_5.data,interictal_segment_6.data,interictal_segment_7.data,interictal_segment_8.data,interictal_segment_9.data,interictal_segment_10.data,interictal_segment_11.data,interictal_segment_12.data,interictal_segment_13.data,interictal_segment_14.data,interictal_segment_15.data,interictal_segment_16.data,interictal_segment_17.data,interictal_segment_18.data,interictal_segment_19.data,interictal_segment_20.data,interictal_segment_21.data,interictal_segment_22.data,interictal_segment_23.data,interictal_segment_24.data);
%preictal_allsegments = horzcat(preictal_segment_1.data, preictal_segment_2.data,preictal_segment_3.data,preictal_segment_4.data,preictal_segment_5.data,preictal_segment_6.data,preictal_segment_7.data,preictal_segment_8.data,preictal_segment_9.data,preictal_segment_10.data,preictal_segment_11.data,preictal_segment_12.data,preictal_segment_13.data,preictal_segment_14.data,preictal_segment_15.data,preictal_segment_16.data,preictal_segment_17.data,preictal_segment_18.data,preictal_segment_19.data,preictal_segment_20.data,preictal_segment_21.data,preictal_segment_22.data,preictal_segment_23.data,preictal_segment_24.data); 
%interictal_preictal_allsegments_24_48 = horzcat(interictal_allsegments_24_48,preictal_allsegments);

%INTERICTAL_ALLSEGMENTS_24_48 = transpose(interictal_allsegments_24_48);
%PREICTAL_ALLSEGMENTS = transpose(preictal_allsegments);
%INTERICTAL_PREICTAL_ALLSEGMENTS_24_48 = transpose(interictal_preictal_allsegments_24_48);

%test_segments_0_48 = horzcat(test_segment_1.data, test_segment_2.data, test_segment_3.data, test_segment_4.data, test_segment_5.data, test_segment_6.data, test_segment_7.data, test_segment_8.data, test_segment_9.data, test_segment_10.data, test_segment_11.data, test_segment_12.data, test_segment_13.data, test_segment_14.data, test_segment_15.data, test_segment_16.data, test_segment_17.data, test_segment_18.data, test_segment_19.data, test_segment_20.data, test_segment_21.data, test_segment_22.data, test_segment_23.data, test_segment_24.data, test_segment_25.data, test_segment_26.data, test_segment_27.data, test_segment_28.data, test_segment_29.data, test_segment_30.data, test_segment_31.data, test_segment_32.data, test_segment_33.data, test_segment_34.data, test_segment_35.data, test_segment_36.data, test_segment_37.data, test_segment_38.data, test_segment_39.data, test_segment_40.data, test_segment_41.data, test_segment_42.data, test_segment_43.data, test_segment_44.data, test_segment_45.data, test_segment_46.data, test_segment_47.data, test_segment_48.data);
%test_segments_0_70 = horzcat(test_segments_0_48,test_segment_49.data, test_segment_50.data, test_segment_51.data, test_segment_52.data, test_segment_53.data, test_segment_54.data, test_segment_55.data, test_segment_56.data, test_segment_57.data, test_segment_58.data, test_segment_59.data, test_segment_60.data, test_segment_61.data, test_segment_62.data, test_segment_63.data, test_segment_64.data, test_segment_65.data, test_segment_66.data, test_segment_67.data, test_segment_68.data, test_segment_69.data, test_segment_70.data);

%P1_interictal_train = horzcat(P1_interictal_segment_1.data, P1_interictal_segment_2.data, P1_interictal_segment_3.data, P1_interictal_segment_4.data, P1_interictal_segment_5.data, P1_interictal_segment_6.data, P1_interictal_segment_7.data, P1_interictal_segment_8.data, P1_interictal_segment_9.data, P1_interictal_segment_10.data, P1_interictal_segment_11.data, P1_interictal_segment_12.data, P1_interictal_segment_13.data, P1_interictal_segment_14.data, P1_interictal_segment_15.data, P1_interictal_segment_16.data, P1_interictal_segment_17.data, P1_interictal_segment_18.data);
%P1_preictal_train = horzcat(P1_preictal_segment_1.data, P1_preictal_segment_2.data, P1_preictal_segment_3.data, P1_preictal_segment_4.data, P1_preictal_segment_5.data, P1_preictal_segment_6.data, P1_preictal_segment_7.data, P1_preictal_segment_8.data, P1_preictal_segment_9.data, P1_preictal_segment_10.data, P1_preictal_segment_11.data, P1_preictal_segment_12.data, P1_preictal_segment_13.data, P1_preictal_segment_14.data, P1_preictal_segment_15.data, P1_preictal_segment_16.data, P1_preictal_segment_17.data, P1_preictal_segment_18.data);

afAudioData =  test_segment_502.data;
AfAudioData = transpose(afAudioData);
numberofchannels = 16;
length1 = length(afAudioData);
iBlockLength = 512;
iHopLength = 256;
f_s = 400;
iNumOfBlocks    = ceil (length(afAudioData)/iHopLength);
afWindow    = hann(iBlockLength,'periodic');
X_mean = zeros(numberofchannels,iNumOfBlocks);
X_std = zeros(numberofchannels,iNumOfBlocks);
Peakpower = zeros(numberofchannels,iNumOfBlocks);
PeakPower_Mean = zeros(numberofchannels, 1);
PeakPower_Std = zeros(numberofchannels,1);

