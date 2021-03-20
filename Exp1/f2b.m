RGB=imread('autumn.tif');
figure,subplot(2,2,1),imshow(RGB);title('原始彩色图像');
I=rgb2gray(RGB); 		%转换为灰度图像
subplot(2,2,2),imshow(I);title('灰度图像');
J=dct2(I);
K=idct2(J);
subplot(2,2,3),imshow(K,[0 255]);title('离散余弦反变换恢复图像');
J(abs(J)<20)=0; 			%舍弃系数
K2=idct2(J);
subplot(2,2,4),imshow(K2,[0 255]);title('舍弃系数后离散余弦反变换恢复图像');
