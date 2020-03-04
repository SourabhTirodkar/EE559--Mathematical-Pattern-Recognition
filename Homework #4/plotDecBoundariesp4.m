function [] = plotDecBoundariesp4(training, label_train, final_w1, final_w2)
%Plot the decision boundaries and data points for minimum distance to
%class mean classifier

% training: traning data
% label_train: class lables correspond to training data
% sample_mean: mean vector for each class

% Total number of classes
nclass =  max(unique(label_train));
L = length(training);
 
% Set the feature range for ploting
max_x = ceil(max(training(:, 1))) + 1;
min_x = floor(min(training(:, 1))) - 1;
max_y = ceil(max(training(:, 2))) + 1;
min_y = floor(min(training(:, 2))) - 1;

xrange = [min_x max_x];
yrange = [min_y max_y];

% step size for how finely you want to visualize the decision boundary.
inc = 0.05;

% generate grid coordinates. this will be the basis of the decision
% boundary visualization.
[x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));

% size of the (x, y) image, which will also be the size of the
% decision boundary image that is used as the plot background.
image_size = size(x);
z=image_size(1)*image_size(2);
pred_label=zeros(image_size(1)*image_size(2),1);
xy = [x(:) y(:)]; % make (x,y) pairs as a bunch of row vectors.
for i=1:1:z
    if(final_w1 *xy(i,1) + final_w2 * xy(i,2) <= 0)
    pred_label(i)=1;
    elseif(final_w1 * xy(i,1) + final_w2 * xy(i,2) > 0)
    pred_label(i)=2;
    end
end

% distance measure evaluations for each (x,y) pair.
% dist_mat = pdist2(xy, sample_mean);
% [~, pred_label] = min(dist_mat, [], 2);

% reshape the idx (which contains the class label) into an image.
decisionmap = reshape(pred_label, image_size);

figure;
 
%show the image, give each coordinate a color according to its class label
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');
 
% colormap for the classes:
% cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1;];
% colormap(cmap);
 
% plot the class training data.
plot(training(label_train == 1,1),training(label_train == 1,2), 'rx');
plot(training(label_train == 2,1),training(label_train == 2,2), 'go');


% include legend for training data
    legend('Class 1', 'Class 2', ...
    'Location','northoutside','Orientation', 'horizontal');



% % create a new axis for lengends of class mean vectors
% ah=axes('position',get(gca,'position'),'visible','off');
%
% % include legend for class mean vector
% if nclass == 3
%     legend(ah, [mean1, mean2, mean3], {'Class 1 Mean', 'Class 2 Mean', 'Class 3 Mean'}, ...
%     'Location','northoutside','Orientation', 'horizontal');
% else
%     legend(ah, [mean1, mean2], {'Class 1 Mean', 'Class 2 Mean'},  ...
%     'Location','northoutside','Orientation', 'horizontal');
% end

% label the axes.
xlabel('featureX');
ylabel('featureY');
end 