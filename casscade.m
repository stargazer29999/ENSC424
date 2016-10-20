%Source: http://www.mathworks.com/help/vision/ug/train-a-cascade-object-detector.html
%The Computer Vision System Toolbox cascade object detector can detect object categories whose aspect ratio does not vary significantly.
%You also must provide a set of negative images from which the function generates negative samples automatically

%Example file path: C:\Program Files\MATLAB\R2015b
%Waldo file path: C:\Users\Kara\Documents\ENSC424\Project

%Load positive samples.
	load('stopSigns.mat');  %Example

%Add the image directory to the MATLAB path.
	imDir = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
    addpath(imDir);
%imDirWALDO=fullfile('C:\','User','Kara','Documents','ENSC424','Project');
%addpath(imDirWALDO);

%Specify the foler for negative images.
	negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');
    

%Train a cascade object detector called 'stopSignDetector.xml' using HOG features. NOTE: The command can take several minutes to run.
trainCascadeObjectDetector('stopSignDetector.xml',data,negativeFolder,'FalseAlarmRate',0.2,'NumCascadeStages',5);

% 		Automatically setting ObjectTrainingSize to [ 35, 32 ]
% 		Using at most 42 of 42 positive samples per stage
% 		Using at most 84 negative samples per stage
% 
% 		Training stage 1 of 5
% 		[........................................................................]
% 		Used 42 positive and 84 negative samples
% 		Time to train stage 1: 1 seconds
% 
% 		Training stage 2 of 5
% 		[........................................................................]
% 		Used 42 positive and 84 negative samples
% 		Time to train stage 2: 0 seconds
% 
% 		Training stage 3 of 5
% 		[........................................................................]
% 		Used 42 positive and 84 negative samples
% 		Time to train stage 3: 5 seconds
% 
% 		Training stage 4 of 5
% 		[........................................................................]
% 		Used 42 positive and 84 negative samples
% 		Time to train stage 4: 11 seconds
% 
% 		Training stage 5 of 5
% 		[........................................................................]
% 		Used 42 positive and 17 negative samples
% 		Time to train stage 5: 21 seconds
% 
% 		Training complete

%Use the newly trained classifier to detect a stop sign in an image.
	detector = vision.CascadeObjectDetector('stopSignDetector.xml');

%Read the test image.
	img = imread('stopSignTest.jpg');

%Detect a stop sign.
	bbox = step(detector,img);

%Insert bounding box rectangles and return the marked image.
	detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'stop sign');

%Display the detected stop sign.
	figure; imshow(detectedImg);
