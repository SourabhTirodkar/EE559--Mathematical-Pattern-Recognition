%% Pre Processing
%Train
disp('Mean of Training Vector:')
disp(mean(feature_train))
disp('Standard Deviation of Training Vector:')
disp(std(feature_train))
[XtrainStd, colMeans, colStd]= zscore(feature_train);
disp('After Standarization:')
disp('Column Mean:')
disp(mean(XtrainStd));
disp('Column SD')
disp(std(XtrainStd));


%% Pre Processing
%Test
disp('Testing data')
disp('Mean of Testing data:')
disp(mean(feature_test));
disp('Standard Deviation of Testing data:')
disp(std(feature_test));

for i=1:13
    XtestStd(:,i)=(feature_test(:,i)-colMeans(i))/colStd(i);
end

disp('After Standarization:')
disp('Column Mean:')
disp(mean(XtestStd))
disp('Column SD')
disp(std(XtestStd))


%% Create data set
%prXtrain = prdataset(XtrainStd(:,1:13), label_train);
%prXtest = prdataset(XtestStd(:,1:13), label_test);

prXtrain = prdataset(feature_train(:,1:13), label_train);
prXtest = prdataset(feature_test(:,1:13), label_test);

% MSE Classifier

%% Training data
errorTrain2=0;
trainedClassifier2_train = fisherc(prXtrain);
predTrainLabels2_train = labeld(prXtrain, trainedClassifier2_train);
errorTrain2 = testc(prXtrain, trainedClassifier2_train)

%% Test data
predTrainLabels2_test = labeld(prXtest, trainedClassifier2_train);
errorTest2 = testc(prXtest, trainedClassifier2_train)

%% Accuracy 
Training_Accuracy_MSE=(1-errorTrain2)*100
Testing_Accuracy_MSE=(1-errorTest2)*100

%%
disp('Training weights')
getWeightsFromPrmapping(trainedClassifier2_train)

