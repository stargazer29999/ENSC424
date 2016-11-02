%Source: http://www.mathworks.com/help/vision/ug/train-a-cascade-object-detector.html

%Example file path is requiredto be in: C:\Program Files\MATLAB\R2015b
%Waldo file path: C:\Users\Kara\Documents\ENSC424\Project
%trainingImageLabeler

%Load positive samples.

    load('labelingSession.mat');
    load('positiveInstances.mat');

%Add the image directory to the MATLAB path.
    imDirWALDO=fullfile(matlabroot,'ENSC424_Project','Oct29');
    addpath(imDirWALDO);

%Specify the folder for negative images.
    negativeFolder = fullfile(matlabroot,'ENSC424_Project','Negative');

    
%Train a cascade object detector called 'stopSignDetector.xml' 
%NOTE: The command can takes 20 minutes to run.
trainCascadeObjectDetector('WaldoDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.5,'NumCascadeStages',3);

%% Use the newly trained classifier to detect a stop sign in an image.
detector = vision.CascadeObjectDetector('WaldoDetector.xml');

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
