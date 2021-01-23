% CYCLE - 10
% Perform wavelwt transform and inverse wavelet transform in MATLAB.

%cleaning
clc;
clear all;
close all;

%Reading an image
img10 =imread("C:\Users\KUTTUSA\Pictures\Matlab\images\li.jpg");

%saperate componets in image
Red_in_img =img10(:,:,1);
Green_in_img =img10(:,:,2);
Blue_in_img =img10(:,:,3);

%Wavelet transform
[LLR,LHR,HLR,HHR]=dwt2(Red_in_img,'haar');
[LLG,LHG,HLG,HHG]=dwt2(Green_in_img,'haar');
[LLB,LHB,HLB,HHB]=dwt2(Blue_in_img,'haar');

%Decomposition
first_level_dc(:,:,1)=[LLR,LHR;HLR,HHR];
first_level_dc(:,:,2)=[LLG,LHG;HLG,HHG];
first_level_dc(:,:,3)=[LLB,LHB;HLB,HHB];
first_level_dc=uint8(first_level_dc);

%Original
subplot(1,2,1);
imshow(img10);
title("ORIGINAL IMAGE");

%First level decomposition 
subplot(1,2,2);
imshow(first_level_dc,[]);
title("IMAGE AFTER FIRST LEVEL DECOMPOSTION");

%Perfom first level decomposition on MATLAB