img=imread('//MATLAB Drive/Assignment-1/image-3.jpg');

%   hesham omar
mf=ones(3,3)/9;
noise_free=imfilter(img,mf,"replicate","full","conv");
noise_free2=imfilter(noise_free,mf,"replicate","full","conv");
noise_free3=imfilter(noise_free2,mf,"replicate","full","conv");


subplot(221),imshow(img);
subplot(222),imshow(noise_free);
subplot(223),imshow(noise_free2);
subplot(224),imshow(noise_free3);

%   applied a median filter using the function imfilter
%       and a 3*3 kernel of ones
%       replicate padding and convolution
%       repeated filter three times



