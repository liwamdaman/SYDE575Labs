close all;

freq_noise = imread('frequnoisy.tif');
figure;
imshow(freq_noise);

% Fourier spectra for noisy image
spectra = fftshift(fft2(freq_noise));
figure;
imshow(log(abs(spectra)), []);
figure;
surfc((log(abs(spectra))));

% % Radius for notch reject filter
% r = 1;
% h = fspecial('disk', r);
% h(h==0) = 1;
% h(h<1) = 0;
% 
% % Image size is 256 x 256
% h_freq = ones(256, 256);
% % Create frequency reject filter
% h_freq(118-r:118+r, 105-r:105+r) = h;
% h_freq(139-r:139+r, 152-r:152+r) = h;
% h_freq(64-r:64+r, 64-r:64+r) = h;
% h_freq(192-r:192+r, 192-r:192+r) = h;
% figure;
% imshow(h_freq);

% Image size is 256 x 256
h_freq = ones(256, 256);
% Create frequency reject filter
h_freq(119, 105) = 0;
h_freq(139, 153) = 0;
h_freq(65, 65) = 0;
h_freq(193, 193) = 0;
figure;
imshow(h_freq);

% Apply filter onto spectra
filtered = spectra .* h_freq;
figure;
imshow(log(abs(filtered)), []);

% reconstructed
reconstructed = ifft2(ifftshift(filtered));
figure;
imshow(abs(reconstructed), []);