
%   hesham omar

img=imread('/MATLAB Drive/Assignment-1/image-2.jpg');

img2=im2gray(img);


new=imadjust(img2);

%   used the imadjust funtion to increase intensity values
%   and converted image to gray image because imadjust only
%       uses gray images
figure;
subplot(121) , imshow(img);
subplot(122) , imshow(new);



