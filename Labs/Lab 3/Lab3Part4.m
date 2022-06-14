noise = imread('frequnoisy.tif');
imshow(log(abs(fftshift(fft2(noise)))),[])