img=imread('/MATLAB Drive/Assignment-1/image-4.jpg');
%   hesham omar

kernel=ones(3,3)/9;
de_noise=imfilter(img,kernel);

subplot(121),imshow(img),title("Noisy Image");
subplot(122),imshow(de_noise),title("Noise Free Image");

%   applied median filter using kernel of ones to
%       remove salt&pepper noise