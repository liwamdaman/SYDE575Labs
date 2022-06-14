close all

cam = double(imread('cameraman.tif'))/255;

smoothed_cam = imfilter(cam, fspecial('gaussian', [7 7], 1));
figure
imshow(smoothed_cam);

subtracted_cam = cam - smoothed_cam;
figure
imshow(subtracted_cam);

enhanced_cam = cam + subtracted_cam;
figure
imshow(enhanced_cam);

enhanced_cam_half_effect = cam + 0.5 * subtracted_cam;
figure
imshow(enhanced_cam_half_effect);
