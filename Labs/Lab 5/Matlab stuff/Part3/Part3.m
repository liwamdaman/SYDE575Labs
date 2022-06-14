close all;
RGB = imread('peppers.png');
% figure
% imshow(RGB);
C = makecform('srgb2lab');
lab = applycform(RGB,C);

ab = double(lab(:,:,2:3)); % NOT im2double
m = size(ab,1);
n = size(ab,2);
ab = reshape(ab,m*n,2);

% K = 2;
% row = [55 200];
% col = [155 400];
K = 4;
row = [55 130 200 280];
col = [155 110 400 470];
% Convert (r,c) indexing to 1D linear indexing.
idx = sub2ind([size(lab,1) size(lab,2)], row, col);
% Vectorize starting coordinates
for k = 1:K
    mu(k,:) = ab(idx(k),:);
end

cluster_idx = kmeans(ab, K, 'Start', mu);

% Label each pixel according to k-means
pixel_labels = reshape(cluster_idx, m, n);
h = figure,imshow(pixel_labels, [])
title('Image labeled by cluster index');
colormap('jet')

%pixel_labels(pixel_labels~=1) = 0;
% pixel_labels(pixel_labels~=2) = 0;
% pixel_labels = pixel_labels./2;
% pixel_labels(pixel_labels~=3) = 0;
% pixel_labels = pixel_labels./3;
pixel_labels(pixel_labels~=4) = 0;
pixel_labels = pixel_labels./4;
imshow(RGB .* uint8(pixel_labels));