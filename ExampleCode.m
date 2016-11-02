%Source: http://www.mathworks.com/help/vision/ug/train-a-cascade-object-detector.html
tic
%Load positive samples.
	load('stopSigns.mat'); 
%Add the image directory to the MATLAB path.
	imDir = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
    addpath(imDir);

%Specify the folder for negative images.
	negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');

%Train a cascade object detector called 'stopSignDetector.xml' using HOG features. NOTE: The command can take several minutes to run.
trainCascadeObjectDetector('stopSignDetector.xml',data,negativeFolder,'FalseAlarmRate',0.2,'NumCascadeStages',5);

%Use the newly trained classifier to detect a stop sign in an image.
	detector = vision.CascadeObjectDetector('stopSignDetector.xml');

%% Read the test image.
img = imread('stopSignTest.jpg');

%Detect a stop sign.
	bbox = step(detector,img);

%Insert bounding box rectangles and return the marked image.
	detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'StopSign');

%Display the detected stop sign.
	figure; imshow(detectedImg);

time_to_compute=toc