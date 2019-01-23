numberofchannels = 16;
length1 = length(interictal_segment_1.data);
iBlockLength = 512;
iHopLength = 256;
f_s = 400;
afWindow    = hann(iBlockLength,'periodic');
afAudioData = interictal_segment_1.data;