%One vs Rest
%Considering 1 vs(2 n 3)
for i=1:89
    if label_train(i)==1
    b1(i)=label_train(i);
    class1_feature1a(i)=(feature_train(i,1));
    class1_feature2a(i)=(feature_train(i,2));
 
    else 
    b1(i-30)=label_train(i);
    class23_feature1a(i-30)=(feature_train(i,1));
    class23_feature2a(i-30)=(feature_train(i,2));
    end
end

m_class1_feature1a=mean(class1_feature1a);
m_class1_feature2a=mean(class1_feature2a);
m_class23_feature1a=mean(class23_feature1a);
m_class23_feature2a=mean(class23_feature2a);


sample_mean=[m_class1_feature1a m_class1_feature2a;m_class23_feature1a m_class23_feature2a];

plotDecBoundaries_ori(feature_train, label_train, sample_mean)
hold on

%Considering 3 vs(1 n 2)
for i=1:89
    if label_train(i)==3
    b1(i-65)=label_train(i);
    class3_feature1b(i-65)=(feature_train(i,1));
    class3_feature2b(i-65)=(feature_train(i,2));
    else 
    b1(i)=label_train(i);
    class12_feature1b(i)=(feature_train(i,1));
    class12_feature2b(i)=(feature_train(i,2));
    end
end


m_class3_feature1b=mean(class3_feature1b);
m_class3_feature2b=mean(class3_feature2b);
m_class12_feature1b=mean(class12_feature1b);
m_class12_feature2b=mean(class12_feature2b);

sample_mean1=[m_class3_feature1b m_class3_feature2b;m_class12_feature1b m_class12_feature2b];

plotDecBoundaries_ori(feature_train, label_train, sample_mean1)

%Considering 2 vs(1 n 3)
for i=1:89
    if label_train(i)==2
    b1(i-30)=label_train(i);
    class2_feature1c(i-30)=(feature_train(i,1));
    class2_feature2c(i-30)=(feature_train(i,2));
    else if label_train(i)==1
    b1(i)=label_train(i);
    class1_feature1c(i)=(feature_train(i,1));
    class1_feature2c(i)=(feature_train(i,2));
    else label_train(i)==3;
    b1(i-65)=label_train(i);
    class3_feature1c(i-65)=(feature_train(i,1));
    class3_feature2c(i-65)=(feature_train(i,2));
        end
    end
end

class13_feature1c=[class1_feature1c class3_feature1c];
class13_feature2c=[class1_feature2c class3_feature2c];

m_class2_feature1c=mean(class2_feature1c);
m_class2_feature2c=mean(class2_feature2c);
m_class13_feature1c=mean(class13_feature1c);
m_class13_feature2c=mean(class13_feature2c);

sample_mean2=[m_class2_feature1c m_class2_feature2c;m_class13_feature1c m_class13_feature2c];

plotDecBoundaries_ori(feature_train, label_train, sample_mean2)
hold off

%Testing
plotDecBoundaries_ori(feature_test, label_test, sample_mean)
plotDecBoundaries_ori(feature_test, label_test, sample_mean1)
plotDecBoundaries_ori(feature_test, label_test, sample_mean2)


