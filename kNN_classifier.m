%% Number Classification Algorithm
%% Author: Shadan Ibrahim
%% Complete Data: 22 Jan 2022

clc
clear 

%Step 1 Load the Data Set & split the train and test 

testFrac = 0.25;

names = dir('Dataset\0\*.png');

NClass = length(names);

NTest = round(NClass*testFrac);

NTrain = NClass - NTest;

maxNum = 9;

H1 = nan(NClass*(maxNum+1),1);
H2 = H1;
H3 = H1;
H4 = H1;
H5 = H1;
H6 = H1;
H7 = H1;

C = H1;

testOnly = false(size(H1));



%Step 2 Choose the Value of K

k = 11;


%% Training Using the Data

ind = 0;
for num = 0:maxNum
   
    pathToIms = fullfile('Dataset',num2str(num));
    
    imFilenames = dir(fullfile(pathToIms,'*.png'));
    for imNo = 1:NClass 
        ind = ind + 1;
        
        im = imread(fullfile(pathToIms,imFilenames(imNo).name));
        
        im = im2double(im);
        
        X = size(im,1);
        Y = size(im,2);

        
        
        % first moment
        H1(ind) = hu(im,1);
        
        % second moment
        H2(ind) = hu(im,2);       
     
        % third moment
        H3(ind) = hu(im,3);
        
        % fourth moment
        H4(ind) = hu(im, 4);
        
        % fith moment
        H5(ind) = hu(im, 5);
        
        % sixth moment
        H6(ind) = hu(im,6);
        
        % seventh moments
        H7(ind) = hu(im,7);
        
        C(ind) = num;
        
        %between this ranges, data is used for testing only
        if imNo >= NTrain 
            testOnly(imNo) = true;
        end 
                             
    end
end




allMetricsTrain = [H1(~testOnly) H2(~testOnly) H3(~testOnly) H4(~testOnly) H5(~testOnly) H6(~testOnly) H7(~testOnly)];
classTrain = C(~testOnly);
allMetricsTest = [H1(testOnly) H2(testOnly) H3(testOnly) H4(testOnly) H5(testOnly) H6(testOnly) H7(testOnly)];
classTest = C(testOnly);

kdTreeModel = KDTreeSearcher(allMetricsTrain);

fprintf("Training Model is Complete\n\n");


%% Test on random point of test data

fprintf("Testing random point from test data\n");
newPointInd = randi(length(classTest));
point = classTest(newPointInd);
fprintf("Numerical picked: %d\n", point);
testImageH1 = allMetricsTest(newPointInd,1);
testImageH2 = allMetricsTest(newPointInd,2);
testImageH3 = allMetricsTest(newPointInd,3);
testImageH4 = allMetricsTest(newPointInd,4);
testImageH5 = allMetricsTest(newPointInd,5);
testImageH6 = allMetricsTest(newPointInd,6);
testImageH7 = allMetricsTest(newPointInd,7);
   
[inds, ~] = knnsearch(kdTreeModel,[testImageH1 testImageH2 testImageH3 testImageH4 testImageH5 testImageH6 testImageH7],'k',k);
prediction = mode(classTrain(inds));

if point == prediction
    fprintf("Correct Classification of numerical %d\n\n", prediction);
else
%    fprintf("Wrong Classification of numerical %d\n\n", prediction);
%end 


%% Accuracy using regular validation

fprintf("Validation Process\n");
preds = zeros(size(classTest));

for testNo = 1:length(classTest) 
    [inds,~] = knnsearch(kdTreeModel,allMetricsTest(testNo,:),'k',k);
    preds(testNo) = mode(classTrain(inds)); % predict class
end

numCorrect = sum(preds==classTest);
accuracy = 100*numCorrect/length(classTest);
fprintf("k = %d, all data tested\n", k);
fprintf("Accuracy: %.2f\n\n %", accuracy);


%% Test on input image 


%read in image
testim = imread("sampleTestImages\num2.jpg");
testim = im2double(testim);
testim = 1 - testim;
        

%calculate the 7 hu moments 
testImageH1 = hu(testim, 1);
testImageH2 = hu(testim, 2);
testImageH3 = hu(testim, 3);
testImageH4 = hu(testim, 4);
testImageH5 = hu(testim, 5);
testImageH6 = hu(testim, 6);
testImageH7 = hu(testim, 7);


%prediction of class
[inds,dists] = knnsearch(kdTreeModel,[testImageH1 testImageH2 testImageH3 testImageH4 testImageH5 testImageH6 testImageH7],'k',k);
prediction2 = mode(classTrain(inds));

fprintf("Test on Input Image Done\n");
fprintf("Classification is: %d\n", prediction2);














   