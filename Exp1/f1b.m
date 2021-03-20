I=imread('cameraman.tif');
figure,subplot(1,3,1),imshow(I);
F = fft2(I);
I2 = ifft2(F);
subplot(1,3,2),imshow(I2, []);
I3 = ifft2(F./abs(F));  % 幅度谱变为1
subplot(1,3,3),imshow(I3, []);
