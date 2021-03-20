RGB=imread('autumn.tif');
figure;imshow(RGB);
I=rgb2gray(RGB); %转换为灰度图像
figure,imshow(I);
J=dct2(I);
figure,imshow(log(abs(J)),[]),colormap(jet(64));colorbar;
