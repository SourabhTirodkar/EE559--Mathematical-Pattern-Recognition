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
prXtrain = prdataset(XtrainStd(:,1:13), label_train);
prXtest = prdataset(XtestStd(:,1:13), label_test);


% Perceptron Classifier

%% Training data
errorTrain1=0;
trainedClassifier1_train = perlc(prXtrain);
predTrainLabels1_train = labeld(prXtrain, trainedClassifier1_train);
errorTrain1 = testc(prXtrain, trainedClassifier1_train)


%% Code for 100 epoch
for k=2:100
    trainedClassifier1_train = perlc(prXtrain);
    predTrainLabels1_train = labeld(prXtrain, trainedClassifier1_train);
    errorTrain1(k) = testc(prXtrain, trainedClassifier1_train);
    if errorTrain1(k) < errorTrain1
        errorTrain1=errorTrain(k);
    end
end
errorTrain1=min(errorTrain1);

%% Test data
predTrainLabels1_test = labeld(prXtest, trainedClassifier1_train);
errorTest1 = testc(prXtest, trainedClassifier1_train)

%% Accuracy 
Training_Accuracy_perceptron=(1-errorTrain1)*100
Testing_Accuracy_perceptron=(1-errorTest1)*100

%%
disp('Final Weights')
getWeightsFromPrmapping(trainedClassifier1_train)

