import numpy as np
import statistics
import math
import scipy.io as sio
import pandas as pd
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix   
from pandas import DataFrame
from sklearn import preprocessing

################################################################################

def FeatureTimeRms(x, iBlockLength, iHopLength, f_s, numberofchannels):
    
    iNumOfBlocks = math.ceil(len(x)/iHopLength)
    
    X = (x + abs(x.min(0))) / x.ptp(0)
    
    epsilon = 1e-5 #-100dB
    
    vrms = np.zeros((iNumOfBlocks, numberofchannels))
    Vrms = np.zeros((iNumOfBlocks, numberofchannels))

    x_2 = X**2    
    
    for m in range(numberofchannels):
        for n in range(iNumOfBlocks):
            i_start     = ((n)*iHopLength)
            i_stop      = min(len(x),i_start + iBlockLength)
            
            
            #vrms[n,m] = np.sqrt(np.mean(np.power(x[i_start:i_stop,m],2)))
            vrms[n,m] = x_2[i_start:i_stop, m].mean()

            #if vrms[n,m] < epsilon:
            #    vrms[n,m] = epsilon
        
            #Vrms[n,m] = 20*np.log10(vrms[n,m])
    
    
    Vrms = np.sqrt(vrms)

    VRMS = 20*np.log10(Vrms)

    s = 'Block Size ' + repr(iBlockLength) + ', Hop Size ' + repr(iHopLength) 
    print(s)
    return VRMS

################################################################################

def FeatureTimeStd(x, iBlockLength, iHopLength, f_s, numberofchannels):

    X = (x + abs(x.min(0))) / x.ptp(0)

    # number of results
    iNumOfBlocks = math.ceil(len(x)/iHopLength)
    
    # allocate memory
    vstd = np.zeros((iNumOfBlocks, numberofchannels))
    Vstd = np.zeros((iNumOfBlocks, numberofchannels))
    
    for m in range(numberofchannels):
        for n in range(iNumOfBlocks):
            i_start     = ((n)*iHopLength)
            i_stop      = min(len(X),i_start + iBlockLength)
        
            # calculate the standard deviation
            vstd[n,m]     = np.std(X[i_start:i_stop, m])
    
    return vstd

################################################################################

def Normalization_Train(TrainData):
    
    X = (TrainData + abs(TrainData.min(0))) / abs((TrainData.max(0) - TrainData.min(0)))
    
    x_min = X.min(0)
    x_max = X.max(0)

    numberofchannels = 16
    for i in range(numberofchannels):
        for j in range(len(TrainData)):
            if (X[j,i] < 0):
                print("bad")

    return (X, x_min, x_max)

################################################################################

def Normalization_Test(TestData, x_min, x_max, numberofchannels):
    #Normalizes Test Data to Training data bounds

    X = np.zeros((len(TestData), numberofchannels))

    Test_min = TestData.min(0)
    Test_max = TestData.max(0)
    
    for i in range(numberofchannels):
        for j in range(len(TestData)):

            X[j,i] = (((x_max[i] - x_min[i])*(TestData[j,i] - Test_min[i])) / (Test_max[i] - Test_min[i])) + x_min[i]
            

    # for i in range(numberofchannels):
    #     for j in range(len(TestData)):
    #         if (X[j,i] < x_min[i]):
    #             print("low")
    #         elif (X[j,i] > x_max[i]):
    #             print("high")

    return X

################################################################################
#TRAIN DATA
data_interictal = sio.loadmat("/Volumes/Apps/MATLAB/AfAudioData_Interictal_Multi.mat")
data_Interictal = data_interictal["AfAudioData_Interictal_Multi"]
x_Interictal = np.array(data_Interictal)

vrms_Interictal = FeatureTimeRms(x_Interictal, 512, 256, 400, 16)
vrms_Interictal = np.array(vrms_Interictal)
(vrms_Interictal_Train_N, x_min_vrms_Interictal, x_max_vrms_Interictal) = Normalization_Train(vrms_Interictal)

std_Interictal = FeatureTimeStd(x_Interictal, 512, 256, 400, 16)
std_Interictal = np.array(std_Interictal)
(std_Interictal_Train_N, x_min_std_Interictal, x_max_std_Interictal) = Normalization_Train(std_Interictal)

################################################################################
#TRAIN DATA
data_preictal = sio.loadmat("/Volumes/Apps/MATLAB/AfAudioData_Preictal_Multi.mat")
data_Preictal = data_preictal["AfAudioData_Preictal_Multi"]
x_Preictal = np.array(data_Preictal)

vrms_Preictal = FeatureTimeRms(x_Preictal, 512, 256, 400, 16)
vrms_Preictal = np.array(vrms_Preictal)
(vrms_Preictal_Train_N, x_min_vrms_Preictal, x_max_vrms_Preictal) = Normalization_Train(vrms_Preictal)

std_Preictal = FeatureTimeStd(x_Preictal, 512, 256, 400, 16)
std_Preictal = np.array(std_Preictal)
(std_Preictal_Train_N, x_min_std_Preictal, x_max_std_Preictal) = Normalization_Train(std_Preictal)

################################################################################

VRMS_Train = np.concatenate((vrms_Interictal_Train_N, vrms_Preictal_Train_N), axis = 0)
STD_Train = np.concatenate((std_Interictal_Train_N, std_Preictal_Train_N), axis = 0)

VRMS_STD_Train = np.concatenate((VRMS_Train, STD_Train), axis = 1)

Classes_Train1 = np.chararray((len(vrms_Interictal), 1))
Classes_Train1[:] = 'I'
Classes_Train2 = np.chararray((len(vrms_Preictal), 1))
Classes_Train2[:] = 'P'
Classes_Train = np.append(Classes_Train1, Classes_Train2)

################################################################################
#TEST DATA
data_interictal_test = sio.loadmat("/Volumes/Apps/MATLAB/AfAudioData_Interictal_Test_Multi.mat")
data_Interictal_Test = data_interictal_test["AfAudioData_Interictal_Test_Multi"]
x_Interictal_Test = np.array(data_Interictal_Test)

vrms_Interictal_Test = FeatureTimeRms(x_Interictal_Test, 512, 256, 400, 16)
vrms_Interictal_Test = np.array(vrms_Interictal_Test)
vrms_Interictal_Test_N = Normalization_Test(vrms_Interictal_Test, x_min_vrms_Interictal, x_max_vrms_Interictal, 16)

std_Interictal_Test = FeatureTimeStd(x_Interictal_Test, 512, 256, 400, 16)
std_Interictal_Test = np.array(std_Interictal_Test)
std_Interictal_Test_N = Normalization_Test(std_Interictal_Test, x_min_std_Interictal, x_max_std_Interictal, 16)

################################################################################
#TEST DATA
data_test = sio.loadmat("/Volumes/Apps/MATLAB/AfAudioData_Preictal_Test_Multi.mat")
data_Test = data_test["AfAudioData_Preictal_Test_Multi"]
x_Test = np.array(data_Test)

vrms_Preictal_Test = FeatureTimeRms(x_Test, 512, 256, 400, 16)
vrms_Preictal_Test = np.array(vrms_Preictal_Test)
vrms_Preictal_Test_N = Normalization_Test(vrms_Preictal_Test, x_min_vrms_Preictal, x_max_vrms_Preictal, 16)

std_Preictal_Test = FeatureTimeStd(x_Test, 512, 256, 400, 16)
std_Preictal_Test = np.array(std_Preictal_Test)
std_Preictal_Test_N = Normalization_Test(std_Preictal_Test, x_min_std_Preictal, x_max_std_Preictal, 16)

################################################################################

VRMS_Test = np.concatenate((vrms_Interictal_Test_N, vrms_Preictal_Test_N), axis = 0)
STD_Test = np.concatenate((std_Interictal_Test_N, std_Preictal_Test_N), axis = 0)

VRMS_STD_Test = np.concatenate((VRMS_Test, STD_Test), axis = 1)

Classes_Test1 = np.chararray((len(vrms_Interictal_Test_N), 1))
Classes_Test1[:] = 'I'
Classes_Test2 = np.chararray((len(vrms_Preictal_Test_N), 1))
Classes_Test2[:] = 'P'
Classes_Test = np.append(Classes_Test1, Classes_Test2)

################################################################################
 
svclassifier = SVC(kernel='linear')  
svclassifier.fit(VRMS_STD_Train, Classes_Train) 

y_pred = svclassifier.predict(VRMS_STD_Test) 
print(confusion_matrix(Classes_Test,y_pred))  
print(classification_report(Classes_Test,y_pred))  