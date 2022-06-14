% cameraman is already in grayscale
cam = imread('cameraman.tif');
% convert lena to grayscale
lena = rgb2gray(imread('lena.tiff'));

down_cam = imresize(cam, 0.25,'bilinear');
down_lena = imresize(lena, 0.25,'bilinear');

figure
imshow(cam);
figure
imshow(lena);
figure
imshow(down_cam);
figure
imshow(down_lena);

nearest_cam = imresize(down_cam, 4, 'nearest');
nearest_lena = imresize(down_lena, 4, 'nearest');

bilinear_cam = imresize(down_cam, 4, 'bilinear');
bilinear_lena = imresize(down_lena, 4, 'bilinear');

bicubic_cam = imresize(down_cam, 4, 'bicubic');
bicubic_lena = imresize(down_lena, 4, 'bicubic');

figure('name','nearest')
imshow(nearest_cam)
figure('name','nearest')
imshow(nearest_lena)

figure('name','bilinear')
imshow(bilinear_cam)
figure('name','bilinear')
imshow(bilinear_lena)

figure('name','bicubic')
imshow(bicubic_cam)
figure('name','bicubic')
imshow(bicubic_lena)

psnr_nearest_cam = psnr(cam, nearest_cam);
psnr_bilinear_cam = psnr(cam, bilinear_cam);
psnr_bicubic_cam = psnr(cam, bicubic_cam);

psnr_nearest_lena = psnr(lena, nearest_lena);
psnr_bilinear_lena = psnr(lena, bilinear_lena);
psnr_bicubic_lena = psnr(lena, bicubic_lena);


