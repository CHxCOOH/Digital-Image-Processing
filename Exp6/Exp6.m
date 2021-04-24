%% 读入图片
I = imread('coins.png');
%I = im2double(I);

%% Otsu算法二值图像分割
K = graythresh(I);      % 使用 Otsu 方法计算全局图像阈值
I_otsu = im2bw(I,K);    % 转换为二值图像
figure, subplot(1,3,1),imshow(I),title('原图');
subplot(1,3,2),imshow(I_otsu),title('otsu算法分割后');
imwrite(I_otsu,'coins_otsu.png');

%% 形态学处理 - 膨胀
SE = strel('square',5);             % 生成方形算子
I_expand = imdilate(I_otsu, SE);    % 膨胀
subplot(1,3,3),imshow(I_expand),title('膨胀');
imwrite(I_expand,'coins_expand.png');