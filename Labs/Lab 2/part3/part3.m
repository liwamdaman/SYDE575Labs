close all

f = [0.3*ones(200,100) 0.7*ones(200,100)];
figure
imshow(f);
figure
plot(imhist(f));
title('Histogram of base image');

f_gaussian = imnoise(f, 'gaussian');
figure
imshow(f_gaussian);
figure
plot(imhist(f_gaussian));
title('Gaussian noise histogram');

f_salt_pepper = imnoise(f, 'salt & pepper');
figure
imshow(f_salt_pepper);
figure
plot(imhist(f_salt_pepper));
title('Salt & pepper noise histogram');

f_speckle = imnoise(f, 'speckle', 0.04);
figure
imshow(f_speckle);
figure
plot(imhist(f_speckle));
title('Speckle noise histogram');