original = imread("Dog.png");

% Using threshold algorithm
% Reading the image and the mask
input = imread('Dog.png');
input = rgb2gray(input);
mask = imread("Dog_mask.png");


% Applying the threshold with value 130
T = 130;

% Iterating on each pixel and set the value accourding to the threshold
[row, col]=size(input);
IM_BW = zeros(row,col);

for i = 1:row
    for j=1:col
        if(input(i,j) > T)
            IM_BW(i,j)=1;
        else
            IM_BW(i,j)=0;
        end
    end
end


% Using k-means clustering algorithm
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
% Reading the image
imgW = imread("Dog.png");

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
%---------------------------------------------------------------------

%evaluating the result using Dice Coefficient Similarity
mask2 = imread("Dog_mask.png");
mask2 = rgb2gray(mask2);

mask2 = false(size(IM_BW));
mask2(25:end-25,25:end-25) = true;

mask2 = im2double(mask2);
IM_BW = im2double(IM_BW);

similarity = dice(mask2, IM_BW);



figure(1),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(IM_BW),title('threshold=130');
subplot(2,2,3),imshow(label2rgb(clustered_img, centroid)),title('K-means segmentation');
subplot(2,2,4),imshow(label2rgb(labelsW)),title('Watershed segmentation');

figure(2),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(mask),title("input Mask");
subplot(2,2,3),imshow(IM_BW),title('output mask');
subplot(2,2,4),imshow(IM_BW),title(num2str(similarity * 100));
%-------------------------------------------------------------------------