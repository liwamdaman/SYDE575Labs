close all;

h_d = fspecial('disk', 4);
h = zeros(256,256);
h(1:9,1:9) = h_d;
h = circshift(h, [-5,-5]);
% figure
% imshow(h, []);
f = im2double(imread('cameraman.tif'));

h_freq = fft2(h);
figure
imshow((abs(h_freq)), []);
f_blur = real(ifft2(h_freq.*fft2(f)));

figure
imshow(f_blur, []);
psnr_blurred = psnr(f_blur, f);

% Now apply inverse filtering to it by dividing the image by the blurring function hfreq
f_restored = ifft2(fft2(f_blur)./h_freq);
figure
imshow(f_restored, []);
psnr_restored = psnr(f_restored, f);

% Now add zero-mean Gaussian noise with a variance of 0.002 to the blurred image.
% Apply inverse filteringto the noisy blurred image. Plot the restored image and the PSNR
gaussian_filter = fspecial('gaussian', 256, 0.002);
f_blur_with_noise = imnoise(f_blur, 'gaussian', 0, 0.002);
figure
imshow(f_blur_with_noise, []);
f_restored_with_noise = ifft2(fft2(f_blur_with_noise)./h_freq);
figure
imshow(f_restored_with_noise, []);
psnr_restored_with_noise = psnr(f_restored_with_noise, f);

% Wiener filter
wiener_filtered = ifftshift(deconvwnr(f_blur_with_noise, h, 0.002/var(f(:))));
figure
imshow(wiener_filtered, []);
psnr_restored_wiener_filter = psnr(wiener_filtered, f);