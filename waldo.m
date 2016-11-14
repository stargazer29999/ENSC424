%Source: http://www.mathworks.com/help/vision/ug/train-a-cascade-object-detector.html

%Example file path is requiredto be in: C:\Program Files\MATLAB\R2015b
%Waldo file path: C:\Users\Kara\Documents\ENSC424\Project
%trainingImageLabeler

%Load positive samples.

   % load('labelingSession.mat');
  
   % load('positiveInstances.mat'); 
 tic  
   
   % load('positiveInstances1.mat'); %38 images files, 42 ROI
     load('positiveInstances2.mat'); %43 images files, 87 ROI
     load('positiveInstances3.mat'); %47 images files, 67 ROI
%%%%%%TODO increase number of postive images%%%%

%Add the image directory to the MATLAB path.
    imDirWALDO=fullfile(matlabroot,'ENSC424_Project','Oct29');
    addpath(imDirWALDO);

%Specify the folder for negative images.
    negativeFolder = fullfile(matlabroot,'ENSC424_Project','Negative');

    
%Train a cascade object detector called 'stopSignDetector.xml' 
%NOTE: The command can takes 20 minutes to run.

% trainCascadeObjectDetector('WaldoDetector10.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.005,'NumCascadeStages',9,'ObjectTrainingSize', [100,60], 'TruePositiveRate', 0.998); %limit of cascade stages and false alarm rate
% trainCascadeObjectDetector('WaldoDetector11.xml',positiveInstances2,negativeFolder,'FalseAlarmRate',0.005,'NumCascadeStages',9,'ObjectTrainingSize', [70,60], 'TruePositiveRate', 0.998); 
% trainCascadeObjectDetector('WaldoDetector12.xml',positiveInstances2,negativeFolder,'FalseAlarmRate',0.005,'NumCascadeStages',9,'ObjectTrainingSize', [100,60], 'TruePositiveRate', 0.998); 
% trainCascadeObjectDetector('WaldoDetector13.xml',positiveInstances2,negativeFolder,'FalseAlarmRate',0.05,'NumCascadeStages',9,'ObjectTrainingSize', [100,60], 'TruePositiveRate', 0.998); 
trainCascadeObjectDetector('WaldoDetector14.xml',positiveInstances3,negativeFolder,'FalseAlarmRate',0.005,'NumCascadeStages',9,'ObjectTrainingSize', [70,60], 'TruePositiveRate', 0.999,'FeatureType','Haar'); 


%% Use the newly trained classifier to detect a stop sign in an image.
% detector = vision.CascadeObjectDetector('WaldoDetector.xml');
detector = vision.CascadeObjectDetector('WaldoDetector14.xml');

% Read the test image.
	img = imread('WaldoTest_small.jpg');
   % img = imread('WaldoTest.jpg');
   % img = imread('waldo2_GeoffCrimmins.jpg'); %Bounding boxes are extremely small here

%Detect a stop sign.
	bbox = step(detector,img);

%Insert bounding box rectangles and return the marked image.
	detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'Waldo');

%Display the detected stop sign.
	figure; imshow(detectedImg);
toc
