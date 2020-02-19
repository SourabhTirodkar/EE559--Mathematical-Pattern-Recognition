for i=1:100
    if label_train(i)==1
    b1(i)=label_train(i);
    class1_feature1(i)=(feature_train(i,1));
    class1_feature2(i)=(feature_train(i,2));
    else
    b2(i-50)=label_train(i);
    class2_feature1(i-50)=(feature_train(i,1));
    class2_feature2(i-50)=(feature_train(i,2));
    end   
end


m_class1_feature1=mean(class1_feature1);
m_class1_feature2=mean(class1_feature2);
m_class2_feature1=mean(class2_feature1);
m_class2_feature2=mean(class2_feature2);

sample_mean=[m_class1_feature1 m_class1_feature2;m_class2_feature1 m_class2_feature2];

plotDecBoundaries_ori(feature_train, label_train, sample_mean)

a1=(feature_train(:,1)-sample_mean(1,1)).^2;
b1=(feature_train(:,2)-sample_mean(1,2)).^2;
euc1=sqrt(a1+b1);

a2=(feature_train(:,1)-sample_mean(2,1)).^2;
b2=(feature_train(:,2)-sample_mean(2,2)).^2;
euc2=sqrt(a2+b2);

class_check=[euc1 euc2];

%error calculation
count=0;
for i=1:100
if euc1(i)< euc2(i) && label_train(i)==2
    count=count+1;
end
if euc1(i)>euc2(i) && label_train(i)==1
    count=count+1;
end
end

%error percentage
ep=(count/100)*100



%Testing
plotDecBoundaries_ori(feature_test, label_test, sample_mean)

a1=(feature_test(:,1)-sample_mean(1,1)).^2;
b1=(feature_test(:,2)-sample_mean(1,2)).^2;
euc1=sqrt(a1+b1);

a2=(feature_test(:,1)-sample_mean(2,1)).^2;
b2=(feature_test(:,2)-sample_mean(2,2)).^2;
euc2=sqrt(a2+b2);

class_check=[euc1 euc2];

%error calculation
count1=0;
for i=1:100
if euc1(i)< euc2(i) & label_test(i)==2
    count1=count1+1;
end
if euc1(i)>euc2(i) & label_test(i)==1
    count1=count1+1;
end
end

%error percentage
ep1=(count1/100)*100