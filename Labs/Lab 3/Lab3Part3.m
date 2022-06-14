lena = imread('lena.tiff');
lena = rgb2gray(lena);
lena = double(lena) ./ 255;
noisy = imnoise(lena, 'gaussian', 0, 0.005);
noisy_freq = (fftshift(fft2(noisy)));
% imshow(noisy_freq, []);
figure(1)
imshow(noisy);
% figure(2)
% imshow(log(abs(fftshift(fft2(noisy)))),[]);
% figure(3)
% imshow(log(abs(fftshift(fft2(lena)))),[]);
r = 60;
h = fspecial('disk', r); 
h(h>0)=1;

height = 512;
width = 512;

h_freq = zeros(height,width);
h_freq(height/2-r:height/2+r, width/2-r:width/2+r) = h;

g = fspecial('gaussian', 512, 60);
m = max(g(:))
g = g ./ max(g(:));

figure(3)
imshow(g)

filtered = noisy_freq .* g;

re = abs(ifft2(ifftshift(filtered)));
psnr(re, lena)

figure(2)
imshow(re, [])