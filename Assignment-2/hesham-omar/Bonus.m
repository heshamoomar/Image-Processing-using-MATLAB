clc
clear All;
% Step 1: Read and Preprocess the Image
image = imread('/MATLAB Drive/Assignment-2/hand.png');
grayImage = rgb2gray(image);


% Step 2: Image Gradient Calculation
gradientImage = imgradient(grayImage);

% Step 3: Thresholding
%threshold = graythresh(image);
% Adaptive Thresholding:
%binaryImage = imbinarize(image, 'adaptive', 'Sensitivity', 1, 'ForegroundPolarity', 'bright');
threshold = 60; 
binaryImage = image > threshold;



% Step 4: Morphological Operations
binaryImage = imopen(binaryImage, strel("arbitrary", .1));

% Step 5: Distance Transform
distanceTransform = bwdist(~binaryImage);

% Step 6: Watershed Transform
markers = imextendedmin(distanceTransform, 2);

segmentation = watershed(distanceTransform);
segmentation(markers == 0) = 0;


% Step 7: Post-processing
segmentation = imclose(segmentation, strel("arbitrary", 10));
segmentation = imfill(segmentation, "holes");

segmentation2D = segmentation(:, :, 1); % Extract the desired 2D matrix
% because image had dimentions at first
% size(segmentation) to check


% Display the segmented image
imshow(label2rgb(segmentation2D, 'jet', 'w'))
