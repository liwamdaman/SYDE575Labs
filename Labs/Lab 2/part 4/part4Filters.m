close all
lena = rgb2gray(imread('lena.tiff'));

% Normalize lena
lena = double(lena)/255;
% figure
% imshow(lena);
% figure
% plot(imhist(lena));
% title('Original lena histogram');

% Add noise
lena_noisy = imnoise(lena, 'salt & pepper');
% figure
% imshow(lena_noisy);
% figure
% plot(imhist(lena_noisy));
% title('Noisy lena histogram with Salt & Pepper');

% h = fspecial('average', [7 7]);
% filtered_lena = imfilter(lena_noisy, h);
% figure
% imshow(filtered_lena);
% figure
% plot(imhist(filtered_lena));
% title('Filtered lena histogram using 7x7 Averaging on Salt&Pepper');
% 
% psnr_original_filtered = 10*log10(1/mean2((lena-filtered_lena).^ 2));

filtered_lena = medfilt2(lena_noisy);
figure
imshow(filtered_lena);
figure
plot(imhist(filtered_lena));
title('Filtered lena histogram using median filter on Salt&Pepper');

psnr_original_filtered = 10*log10(1/mean2((lena-filtered_lena).^ 2));

