%Reflecting features
table1=(1)*(feature_train(1:50,1:2));
table2=(-1)*(feature_train(51:100,1:2));
table_f=vertcat(table1,table2);

table_final=[table_f,label_train];

shuffle = table_final(randperm(size(table_final,1)),:);

[row col]=size(feature_train);
[row1 col1]=size(feature_test);
w1=0.1;
w2=0.1;
for k=1:1:1000 % epoch
a=w1;
b=w2;
for i=1:1:row
  if ((w1*shuffle(i,1) + w2*shuffle(i,2)) <= 0)
      w1=shuffle(i,1) + w1;
      w2=shuffle(i,2) + w2;
  end
end

if (a==w1 && b==w2)
    break
end
end


error=0;
for i=1:row
  if ((w1*shuffle(i,1) + w2*shuffle(i,2)) <= 0)
        error=error+1;
  end
end


%Test
error1=0;
for i=1:row1
    if (label_test(i) == 1)
         if ((w1*feature_test(i,1) + w2*feature_test(i,2)) <=0)
                 error1=error1+1;
        end
    else
         if ((w1*feature_test(i,1) + w2*feature_test(i,2)) > 0)
                error1=error1+1;
         end
    end
end

%error percentage
train_error=(error/row)*100;
test_error=(error1/row1)*100;

plotDecBoundariesp4(feature_train, label_train, w1, w2)

plotDecBoundariesp4(feature_test, label_test, w1, w2)

