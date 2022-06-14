close all;
RGB = imread('peppers.png');
figure
imshow(RGB);
YCBCR = rgb2ycbcr(RGB);

figure;
subplot(1,3,1)
Y = YCBCR(:,:,1);
imshow(Y)
title('Y component');
subplot(1,3,2)
Cb = YCBCR(:,:,2);
imshow(Cb)
title('Cb component');
subplot(1,3,3)
Cr = YCBCR(:,:,3);
imshow(Cr)
title('Cr component');

CbUpscaled = imresize(imresize(Cb, 0.5), 2, "bilinear");
CrUpscaled = imresize(imresize(Cr, 0.5), 2, "bilinear");
YCBCR(:,:,2) = CbUpscaled;
YCBCR(:,:,3) = CrUpscaled;
chromaRestoredRGB = ycbcr2rgb(YCBCR);
figure
imshow(chromaRestoredRGB);

YUpscaled = imresize(imresize(Y, 0.5), 2, "bilinear");
YCBCR(:,:,1) = YUpscaled;
YCBCR(:,:,2) = Cb;
YCBCR(:,:,3) = Cr;
lumaRestoredRGB = ycbcr2rgb(YCBCR);
figure
imshow(lumaRestoredRGB);


