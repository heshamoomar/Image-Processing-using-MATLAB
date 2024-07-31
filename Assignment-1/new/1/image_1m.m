clc
%   hesham omar
%   apply histogram equalization to increase constrast 
img=imread('/MATLAB Drive/Assignment-1/image-1.png');

subplot(121) , imshow(img);
subplot(122) , imhist(img);
Equalized = histeq(img);
figure;
subplot(121) , imshow(Equalized);
subplot(122) , imhist(Equalized);


