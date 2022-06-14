close all
lena = rgb2gray(imread('lena.tiff'));

% Normalize lena
lena = double(lena)/255;
figure
imshow(lena)

h1 = (1/6)*ones(1,6);
h2 = h1';
h3 = [-1 1];

lena_h1 = conv2(lena, h1);
figure
imshow(lena_h1);
lena_h2 = conv2(lena, h2);
figure
imshow(lena_h2);
lena_h3 = conv2(lena, h3);
figure
imshow(lena_h3);