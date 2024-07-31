%Slopes chosen are 0.5, 2 and 0.5
close all;
clear all;
clc
%I=imread('Maulik.png');
I=imread('/MATLAB Drive/Assignment-1/image-6.jpg');
%I=rgb2gray(I);
I=im2double(I);
I = (I * 2) / max(I(:));
I_str = 0;
[row,col] = size(I);
LT = 100; % The lower threshold value
UT = 150; % The upper threshold valaue grid on;
for i=1:row
for j=1:col
if I(i,j)<=LT
I_str(i,j)=0.5*I(i,j);
else if I(i,j)<=UT
I_str(i,j)=2*(I(i,j)-LT)+(0.5*LT);
else
I_str(i,j)=0.5*(I(i,j)-UT)+0.5*LT+2*(UT-LT);
end
end
end
end
dd=[];
hold on;
dd(1:100)=0.5*(0:99);
dd(101:150)=2*((100:149)-100)+0.5*100; 
dd(151:256)=(0.5*((150:255)-150))+(0.5*100)+(2*(150-100));
axis tight;
plot(dd);
hold on;
xlabel('Intensity in input image');
ylabel('Intensity in output image');
title('Contrast-Stretch Transformation function');
figure

subplot(212),imshow(I_str);

