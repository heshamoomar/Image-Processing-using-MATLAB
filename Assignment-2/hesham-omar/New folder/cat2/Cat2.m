original = imread("Cat2_mask.jpg");

input = imread('Cat2_mask.jpg');
mask = imread("Cat2.jpg");

% Converting image to gray
input = rgb2gray(input);

% Applying edge detection
input = edge(input, 'canny');

% Closing the edge lines
input = imclose(input, strel('line', 4, 0));

% Filling the gaps
input = imfill(input, 'holes');

% Removing unnecessary background
input = imerode(input, strel(ones(4,4)));
input = bwareaopen(input, 1000);


% Using threshold algorithm
image1= imread("Cat2_mask.jpg");


% Applying the threshold with value 140 
t = 140;

% Iterating on each pixel and set the value accourding to the thershold
% if pixel > threshold value then assign pixel value to 255 else 0
[height, width]=size(image1);
for i=1:height
    for j=1:width
        if(image1(i,j)>t)
            image1(i,j) = 255;
        else
            image1(i,j)= 0;
        end
    end
end

% Using k-means clustering algorithm
% 2double
% to 2d array
% segment into clusters
% reshape indiciesback into image

% Convert the image to double
img_double = im2double(original);

% Reshape the image into a 2D array for k-means clustering
img_reshaped = reshape(img_double, [], 3);

% Use k-means clustering to segment the image into 4 clusters
num_clusters = 4;
[cluster_idx, centroid] = kmeans(img_reshaped, num_clusters);

% Reshape the cluster indices back into an image
clustered_img = reshape(cluster_idx, size(original, 1), size(original, 2));


% Using watershed algorithm
% convert to gray
% binary mask
% create distance map
% evaluate dice coeff similarity

% Reading the image
imgW = imread('Cat1.jpg');

% Convert the image to grayscale
img_grayW = rgb2gray(imgW);

% Threshold the image to create a binary mask
threshold = graythresh(img_grayW);
binary_mask = imbinarize(img_grayW, threshold);

% Use the distance transform to create a "distance map" where the pixel values
% represent the distance to the nearest non-zero pixel in the binary mask
distance_transform = bwdist(~binary_mask);

% Apply the watershed algorithm to the distance map to segment the image
labelsW = watershed(-distance_transform);


% Evaluating the result using Dice Coefficient Similarity
mask2 = imread("Cat2.jpg");
mask2 = rgb2gray(mask2);

mask2 = false(size(input));
mask2(25:end-25,25:end-25) = true;

mask2 = im2double(mask2);
input = im2double(input);

similarity = dice(mask2, input);



figure(1),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(image1),title('threshold=140');
subplot(2,2,3),imshow(label2rgb(clustered_img, centroid)),title('K-means segmentation');
subplot(2,2,4),imshow(label2rgb(labelsW)),title('Watershed segmentation');

figure(2),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(mask),title("input Mask");
subplot(2,2,3),imshow(input),title('output mask');
subplot(2,2,4),imshow(input),title(num2str(similarity * 100));
%-------------------------------------------------------------------------