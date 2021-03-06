I = imread("lena.png");
I_gray = rgb2gray(I);
imwrite(I_gray,"gray.png");

I_dst = imread('example.jpg');
I_RGB = gray2rgb(I_gray, I_dst);
imshow(I_RGB);

figure, 
subplot(2,2,1),imshow(I),title('原图');
subplot(2,2,2),imshow(I_gray),title('生成的灰度图');
subplot(2,2,3),imshow(I_dst),title('参考的调色板图像');
subplot(2,2,4),imshow(I_RGB),title('效果图');
imwrite(I_RGB,"I_RGB.png");