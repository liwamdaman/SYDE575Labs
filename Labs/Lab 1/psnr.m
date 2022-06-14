function [psnr] = psnr(f,g)
%Calculates PSNR from two images
%   Detailed explanation goes here
mse_out = mse(f,g);
psnr = 10*log10(255^2/mse_out);
end

