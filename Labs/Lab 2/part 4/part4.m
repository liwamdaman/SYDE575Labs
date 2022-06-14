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
lena_noisy = imnoise(lena, 'gaussian', 0, 0.002);
figure
imshow(lena_noisy);
figure
plot(imhist(lena_noisy));
title('Noisy lena histogram');

psnr_original_noisy = 10*log10(1/mean2((lena-lena_noisy).^ 2));

h = fspecial('average');
figure
imagesc(h);
colormap(gray);
title('Averaging 3x3 filter');

filtered_lena = imfilter(lena_noisy, h);
figure
imshow(filtered_lena);
figure
plot(imhist(filtered_lena));
title('Filtered lena histogram using 3x3');

psnr_original_filtered_3 = 10*log10(1/mean2((lena-filtered_lena).^ 2));

h7 = fspecial('average', [7 7]);
filtered_lena_7 = imfilter(lena_noisy, h7);
figure
imshow(filtered_lena_7);
figure
plot(imhist(filtered_lena_7));
title('Filtered lena histogram using 7x7');

psnr_original_filtered_7 = 10*log10(1/mean2((lena-filtered_lena_7).^ 2));

h_gaussian = fspecial('gaussian', [7 7], 1);
filtered_lena_gaussian = imfilter(lena_noisy, h7);
figure
imshow(filtered_lena_7);
figure
plot(imhist(filtered_lena_7));
title('Filtered lena histogram using 7x7');

psnr_original_filtered_7 = 10*log10(1/mean2((lena-filtered_lena_7).^ 2));