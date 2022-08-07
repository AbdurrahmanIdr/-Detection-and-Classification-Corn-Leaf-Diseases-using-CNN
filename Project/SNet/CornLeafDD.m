while (1==1)
    choice=menu('Corn Leaf Disease Detection','....... Testing......','........ Close........');
    
    if (choice==1)
        %% Image Acquisition
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');

%Reading the image using imread function
I = imread([pathname,filename]);

% load the pretrained SqueezeNet model
load('netS.mat')
net = trainedNetwork_1;

%Determining the input size of the network using the InputSize property of the first layer of the network
inputSize = net.Layers(1).InputSize;

%Resizing the image to the input size of the network.
I = imresize(I,inputSize(1:2));

%Classifying the test image using the trained network.
[YPred,probs] = classify(net,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");

% %
% Display Top Predictions

[~,idx] = sort(probs,'descend');
idx = idx(4:-1:1);
classNamesTop = net.Layers(end).ClassNames(idx);
probsTop = probs(idx);

figure
barh(probsTop)
xlim([0 1])
title('Predictions')
xlabel('Probability')
yticklabels(classNamesTop)
    end
    if (choice==2)
        close all;
        return;
    end
end