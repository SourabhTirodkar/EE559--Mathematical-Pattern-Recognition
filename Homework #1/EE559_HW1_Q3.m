for k=1:12
    for m= k+1:13
        

for i=1:89
    if label_train(i)==1
    b1(i)=label_train(i);
    class1_feature1(i)=(feature_train(i,k));
    class1_feature2(i)=(feature_train(i,m));
    else if label_train(i)==2;
    b2(i-30)=label_train(i);
    class2_feature1(i-30)=(feature_train(i,k));
    class2_feature2(i-30)=(feature_train(i,m)); 
    else label_train(i)==3;
    b1(i-65)=label_train(i);
    class3_feature1(i-65)=(feature_train(i,k));
    class3_feature2(i-65)=(feature_train(i,m));
        end
    end
end


m_class1_feature1=mean(class1_feature1);
m_class1_feature2=mean(class1_feature2);
m_class2_feature1=mean(class2_feature1);
m_class2_feature2=mean(class2_feature2);
m_class3_feature1=mean(class3_feature1);
m_class3_feature2=mean(class3_feature2);

sample_mean=[m_class1_feature1 m_class1_feature2; m_class2_feature1 m_class2_feature2; m_class3_feature1 m_class3_feature2];

% plotDecBoundaries(feature_train, label_train, sample_mean)

a1=(feature_train(:,k)-sample_mean(1,1)).^2;
b1=(feature_train(:,m)-sample_mean(1,2)).^2;
euc1=sqrt(a1+b1);

a2=(feature_train(:,k)-sample_mean(2,1)).^2;
b2=(feature_train(:,m)-sample_mean(2,2)).^2;
euc2=sqrt(a2+b2);

a3=(feature_train(:,k)-sample_mean(3,1)).^2;
b3=(feature_train(:,m)-sample_mean(3,2)).^2;
euc3=sqrt(a3+b3);

class_check=[euc1 euc2 euc3];

%error calculation
count=0;
for i=1:89
if ((euc1(i)< euc2(i)) && (euc1(i)< euc3(i))) 
    if (label_train(i)==2 || label_train(i)==3 )
    count=count+1;
    end
end
if ((euc2(i)< euc1(i)) && (euc2(i)< euc3(i)))
    if (label_train(i)==1 || label_train(i)==3 )
    count=count+1;
    end
end
if ((euc3(i)< euc1(i)) && (euc3(i)< euc2(i)))
    if (label_train(i)==1 || label_train(i)==2 )
    count=count+1;
    end
end
end

%error percentage
ep(k,m)=(count/89)*100;



M=min(ep);
MM=min(M);
M(1,1)=0;
N=find(M==MM);

%Array Indices found out
% k=1;
% N=max(N);
% m=N;

%Testing
% plotDecBoundaries(feature_test, label_test, sample_mean)

a1=(feature_test(:,k)-sample_mean(1,1)).^2;
b1=(feature_test(:,m)-sample_mean(1,2)).^2;
euc1=sqrt(a1+b1);

a2=(feature_test(:,k)-sample_mean(2,1)).^2;
b2=(feature_test(:,m)-sample_mean(2,2)).^2;
euc2=sqrt(a2+b2);

a3=(feature_test(:,k)-sample_mean(3,1)).^2;
b3=(feature_test(:,m)-sample_mean(3,2)).^2;
euc3=sqrt(a3+b3);

class_check=[euc1 euc2 euc3];

%error calculation
count1=0;
for i=1:89
if ((euc1(i)< euc2(i)) && (euc1(i)< euc3(i))) 
    if (label_test(i)==2 || label_test(i)==3 )
    count1=count1+1;
    end
end
if ((euc2(i)< euc1(i)) && (euc2(i)< euc3(i)))
    if (label_test(i)==1 || label_test(i)==3 )
    count1=count1+1;
    end
end
if ((euc3(i)< euc1(i)) && (euc3(i)< euc2(i)))
    if (label_test(i)==1 || label_test(i)==2 )
    count1=count1+1;
    end
end
end

%error percentage
ep1(k,m)=(count1/89)*100;


    end
end
