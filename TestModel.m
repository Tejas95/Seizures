yfit1 = D1_trainedModel_LinearSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);
yfit2 = D1_trainedModel_QuadSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);
yfit3 = D1_trainedModel_CubicSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);
yfit4 = D1_trainedModel_FineGaussianSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);
yfit5 = D1_trainedModel_MediumGaussianSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);
yfit6 = D1_trainedModel_CoarseGaussianSVM_NonLinearEnergyMean.predictFcn(NonLinearEnergyMean_Data);

temp = 0;
temp1 = 0;

for i = 1:length(yfit1)
    if yfit1(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy1 = (temp1)*100/length(yfit1);

temp = 0;
temp1 = 0;

for i = 1:length(yfit2)
    if yfit2(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy2 = (temp1)*100/length(yfit2);

temp = 0;
temp1 = 0;

for i = 1:length(yfit3)
    if yfit3(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy3 = (temp1)*100/length(yfit3);

temp = 0;
temp1 = 0;

for i = 1:length(yfit4)
    if yfit4(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy4 = (temp1)*100/length(yfit4);

temp = 0;
temp1 = 0;

for i = 1:length(yfit5)
    if yfit5(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy5 = (temp1)*100/length(yfit5);

temp = 0;
temp1 = 0;

for i = 1:length(yfit6)
    if yfit6(i) == 'I'
        temp = temp+1;
    else
        temp1 = temp1+1;
    end
end

Accuracy6 = (temp1)*100/length(yfit6);
