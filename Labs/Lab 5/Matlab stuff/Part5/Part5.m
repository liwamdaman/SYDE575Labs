close all;

Z = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];
Z = 10.*Z;

f = double(rgb2gray(imread('lena.tiff')));
T = dctmtx(8);
F_trans = floor(blkproc(f-128,[8 8],'P1*x*P2', T, T'));
F_Quantized = round(blkproc(F_trans, [8 8], 'x./P1', Z));
f_reconstructed = floor(blkproc(F_Quantized, [8 8], 'P1*(x.*P3)*P2', T', T, Z)) + 128;
figure
imshow(f_reconstructed, [])
psnrLena = psnr(uint8(f_reconstructed), uint8(f));