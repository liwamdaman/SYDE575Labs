% Close all open figures
close all;

tire = imread('tire.tif');
tire_hist = imhist(tire);
figure
plot(tire_hist)
title('Histogram')
ylabel('Frequency') 
xlabel('Intensity') 

figure
imshow(tire)
neg_tire = 255 - tire;
neg_hist = imhist(neg_tire)
figure
imshow(neg_tire)
figure
plot(neg_hist)
title('Histogram of Negative Image')
ylabel('Frequency') 
xlabel('Intensity') 


% gamma = 1.3
temp = double(tire).^1.3;
power_transform = uint8(temp);
power_hist = imhist(power_transform);
figure
plot(power_hist)
title('Histogram of Image (Gamma = 1.3)')
ylabel('Frequency') 
xlabel('Intensity') 
figure
imshow(power_transform)


equalized = histeq(tire)
equalized_hist = imhist(equalized)
figure
imshow(equalized)
figure
plot(equalized_hist)
title('Histogram of Equalized Image')
ylabel('Frequency') 
xlabel('Intensity') 

