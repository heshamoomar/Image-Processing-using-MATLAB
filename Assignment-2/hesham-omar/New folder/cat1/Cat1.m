original = imread("/MATLAB Drive/Assignment-2/New Folder/Cat1.jpg");

% threshold algorithm
image1= imread("/MATLAB Drive/Assignment-2/New Folder/Cat1.jpg");
mask = imread("/MATLAB Drive/Assignment-2/New Folder/Cat1_mask.jpg");


% Applying the threshold with value 130 
t = 130;

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


% k-means clustering algorithm
% 2double
% to 2d array
% reshape indicies back into image

img_double = im2double(original);

% Reshape the image into a 2D array for k-means clustering
img_reshaped = reshape(img_double, [], 3);

% Use k-means clustering to segment the image into 3 clusters
num_clusters = 3;
[cluster_idx, centroid] = kmeans(img_reshaped, num_clusters);

% Reshape the cluster indices back into an image
clustered_img = reshape(cluster_idx, size(original, 1), size(original, 2));



% Using watershed algorithm
% convert to gray
% binary mask
% create distance map

% Reading the image
imgW = imread('/MATLAB Drive/Assignment-2/New Folder/Cat1.jpg');

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

% evaluate dice coeff similarity

% Evaluating the result using Dice Coefficient Similarity
mask2 = imread("/MATLAB Drive/Assignment-2/New Folder/Cat1_mask.jpg");
mask2 = rgb2gray(mask2);

mask2 = false(size(image1));
mask2(25:end-25,25:end-25) = true;

mask2 = im2double(mask2);
image1 = im2double(image1);

similarity = dice(mask2, image1);



figure(1),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(image1),title('threshold=130');
subplot(2,2,3),imshow(label2rgb(labelsW)),title('Watershed');
subplot(2,2,4),imshow(label2rgb(clustered_img, centroid)),title('K-means');


figure(2),
subplot(2,2,1),imshow(original),title('original');
subplot(2,2,2),imshow(mask),title("input mask");
subplot(2,2,3),imshow(image1),title('output mask');
subplot(2,2,4),imshow(image1),title(num2str(similarity * 100));