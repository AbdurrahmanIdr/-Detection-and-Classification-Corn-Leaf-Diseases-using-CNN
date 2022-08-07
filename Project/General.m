%% Project Title: Maize Leaf Disease Detection

close all 
clear; clc;


while (1==1)
    choice=menu('Corn Leaf Disease Detection','....... SqueezeNet........','....... GoogleNet......','....... Trainned Network......','........ The Best........','........ Close........');
    
    if (choice==1)
      %% Image Acquisition
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');
I = imread([pathname,filename]);

load('netS.mat')
net = trainedNetwork_1;
inputSize = net.Layers(1).InputSize;
I = imresize(I,inputSize(1:2));

[YPred,probs] = classify(net,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");
    end
    if (choice==2)
        
        %% Image Acquisition
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');
I = imread([pathname,filename]);

load('netG.mat')
net = trainedNetwork_1;
inputSize = net.Layers(1).InputSize;
I = imresize(I,inputSize(1:2));

[YPred,probs] = classify(net,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");
    end
     if (choice==3)
        
        %% Image Acquisition
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');
I = imread([pathname,filename]);

load('netT.mat')
inputSize = net.Layers(1).InputSize;
I = imresize(I,inputSize(1:2));

[YPred,probs] = classify(net,I);
imshow(I)
label = YPred;
title = title(string(label) + ", " + num2str(100*max(probs),3) + "%");
     end
     if (choice==4)
        
        %% Image Acquisition
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');
I = imread([pathname,filename]);

load('netG.mat')
net1 = trainedNetwork_1;
inputSize = net1.Layers(1).InputSize;
I1 = imresize(I,inputSize(1:2));

[YPred1,probs1] = classify(net1,I1);
probs1 = 100*max(probs1);
label1 = YPred1;

load('netS.mat')
net2 = trainedNetwork_1;
inputSize = net2.Layers(1).InputSize;
I2 = imresize(I,inputSize(1:2));

[YPred2,probs2] = classify(net2,I2);
probs2 = 100*max(probs2);
label2 = YPred2;

load('netT.mat')
net3 = net;
inputSize = net3.Layers(1).InputSize;
I3 = imresize(I,inputSize(1:2));

[YPred3,probs3] = classify(net3,I3);
probs3 = 100*max(probs3);
label3 = YPred3;

imshow(I)
labels = [label1 label2 label3];
pro = [probs1 probs2 probs3];
[mx, in] = max(pro);
% str = string(labels(in));
title(string(labels(in)) + ", " + num2str(pro(in), 3) + "%");
    end
    if (choice==5)
        close all;
        return;
    end
end