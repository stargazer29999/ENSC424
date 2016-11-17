clc
clear


in_name = 'input1.jpg';
%in_name = 'waldo1.png';

%% Read image
in_image = imread(in_name);
in_size = size(in_image); %(x, y)
%in_dim1 = in_image(:,:,1); %Red
%in_dim2 = in_image(:,:,2); %Green
%in_dim3 = in_image(:,:,3); %Blue

figure;
imshow(in_image)

%% Conversion from RGB to Greyscale
grey_image = rgb2gray(in_image);

figure;
imshow(grey_image)

%% Output
out_name = 'test.jpeg';
imwrite(grey_image, out_name)

