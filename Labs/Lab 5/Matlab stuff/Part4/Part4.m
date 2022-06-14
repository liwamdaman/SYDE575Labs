close all;

f = double(rgb2gray(imread('lena.tiff')));
figure
imshow(f, [])

T = dctmtx(8);
figure
imshow(T);
figure
plot(T(1,:));
hold on
plot(T(2,:));
plot(T(3,:));
plot(T(4,:));
plot(T(5,:));
plot(T(6,:));
plot(T(7,:));
plot(T(8,:));
hold off
legend("row 1", "row 2", "row 3", "row 4", "row 5", "row 6", "row 7", "row 8")

F_trans = floor(blkproc(f-128,[8 8],'P1*x*P2', T, T'));
% figure
% imshow(abs(F_trans), []);
% figure
% imshow(f(81:88, 297:304));
figure
imshow(abs(F_trans(81:88, 297:304)), []);
figure
imshow(abs(F_trans(1:8, 1:8)), []);

mask = zeros(8, 8);
mask(1, 1) = 1;
mask(1, 2) = 1;
mask(1, 3) = 1;
mask(2, 1) = 1;
mask(3, 1) = 1;
mask(2, 2) = 1;
%imshow(mask, [])
F_thresh = blkproc(F_trans, [8 8], 'P1.*x', mask);
f_thresh = floor(blkproc(F_thresh, [8 8], 'P1*x*P2', T', T)) + 128;
figure
imshow(f_thresh, [])
psnrLena = psnr(uint8(f_thresh), uint8(f));