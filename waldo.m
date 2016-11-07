%Source: http://www.mathworks.com/help/vision/ug/train-a-cascade-object-detector.html

%Example file path is requiredto be in: C:\Program Files\MATLAB\R2015b
%Waldo file path: C:\Users\Kara\Documents\ENSC424\Project
%trainingImageLabeler

%Load positive samples.

   % load('labelingSession.mat');
   
   % load('positiveInstances.mat'); 
 tic  
   
    load('positiveInstances1.mat'); %38 images files, 42 ROI
%%%%%%TODO increase number of postive images%%%%

%Add the image directory to the MATLAB path.
    imDirWALDO=fullfile(matlabroot,'ENSC424_Project','Oct29');
    addpath(imDirWALDO);

%Specify the folder for negative images.
    negativeFolder = fullfile(matlabroot,'ENSC424_Project','Negative');

    
%Train a cascade object detector called 'stopSignDetector.xml' 
%NOTE: The command can takes 20 minutes to run.

% trainCascadeObjectDetector('WaldoDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',3, 'FeatureType','HOG'); %default 'FeatureType'
% trainCascadeObjectDetector('WaldoDetector1.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',3, 'FeatureType','HOG'); %default 'FeatureType'
% trainCascadeObjectDetector('WaldoDetector2.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.75,'NumCascadeStages',3,'FeatureType','HOG'); %default 'FeatureType'
% trainCascadeObjectDetector('WaldoDetector3.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',3,'FeatureType', 'LBP');
% trainCascadeObjectDetector('WaldoDetector4.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',10,'FeatureType','HOG');
% trainCascadeObjectDetector('WaldoDetector5.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',10,'ObjectTrainingSize', [110,70]);
% trainCascadeObjectDetector('WaldoDetector6.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.25,'NumCascadeStages',10,'ObjectTrainingSize', [110,70]);
% trainCascadeObjectDetector('WaldoDetector7.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.25,'NumCascadeStages',20,'ObjectTrainingSize', [110,70]);
 trainCascadeObjectDetector('WaldoDetector8.xml',positiveInstances1,negativeFolder,'FalseAlarmRate',0.15,'NumCascadeStages',10,'ObjectTrainingSize', [110,70], 'TruePositiveRate', 0.997);


%%%%%%TODO try several trainCascadeObjectDetector configrutations%%%%


%% Use the newly trained classifier to detect a stop sign in an image.
% detector = vision.CascadeObjectDetector('WaldoDetector.xml');
% detector = vision.CascadeObjectDetector('WaldoDetector1.xml');
% detector = vision.CascadeObjectDetector('WaldoDetector2.xml');
% detector = vision.CascadeObjectDetector('WaldoDetector3.xml');
% detector = vision.CascadeObjectDetector('WaldoDetector5.xml');
% detector = vision.CascadeObjectDetector('WaldoDetector6.xml');
detector = vision.CascadeObjectDetector('WaldoDetector8.xml');


% Read the test image.
	img = imread('WaldoTest_small.jpg');
    %img = imread('waldo2_GeoffCrimmins.jpg'); %Bounding boxes are
    %extremely small here

%Detect a stop sign.
	bbox = step(detector,img);

%Insert bounding box rectangles and return the marked image.
	detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'Waldo');

%Display the detected stop sign.
	figure; imshow(detectedImg);
toc


