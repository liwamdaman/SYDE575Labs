close all;
f = zeros(256,256);
f(:,108:148)=1;
f=imrotate(f, 45);
figure(1)
imshow(f)

fourier_spectra = fft2(f);
shift = fftshift(fft2(f));
a = abs(fftshift(fft2(f)));
figure(2)
imshow(log(abs(fftshift(fft2(f)))),[])

lena = imread('lena.tiff');
lena = rgb2gray(lena);
amplitude = abs(fftshift(fft2(lena)));
phase = fftshift(fft2(lena))./amplitude;
re = ifft2(ifftshift(amplitude));
m = max(re(:))
% 
% figure(1)
% imshow(lena)
% 
% figure(2)
% imshow(ifft2(ifftshift(amplitude)), []);
% 
% figure(3)
% imshow(ifft2(ifftshift(phase)),[]);