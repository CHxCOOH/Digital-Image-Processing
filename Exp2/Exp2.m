% 读入图像
mandi = imread('mandi.tif');

% 添加高斯噪声
mandi_noise = imnoise(mandi,'gaussian',0,0.01);
imwrite(mandi_noise, 'mandi_noise.png');  % 写入添加高斯噪声后的图像到文件

% 展示图像
f1 = figure;
figure(f1),
subplot(1,2,1),
imshow(mandi),title('mandi');

subplot(1,2,2),
imshow(mandi_noise),title('mandi_noise');

% 为使用filter2函数滤波，转换图像为double类型矩阵
mandi_noise = im2double(mandi_noise);

% 创建不同大小的均值滤波器
h_avg_std = fspecial('average');        % 默认大小为[3,3]
h_avg_5_5 = fspecial('average',[5,5]);
h_avg_9_9 = fspecial('average',[9,9]);
h_avg_13_13 = fspecial('average',[13,13]);

% 滤波
filtered_std = filter2(h_avg_std, mandi_noise);
filtered_5_5 = filter2(h_avg_5_5, mandi_noise);
filtered_9_9 = filter2(h_avg_9_9, mandi_noise);
filtered_13_13 = filter2(h_avg_13_13, mandi_noise);

% 展示滤波后图像
f2 = figure;
figure(f2),
subplot(2,3,1),
imshow(mandi),title('原图');
subplot(2,3,2),
imshow(mandi_noise),title('添加高斯噪声');
subplot(2,3,3),
imshow(filtered_std),title('[3,3]均值滤波');
subplot(2,3,4),
imshow(filtered_5_5),title('[5,5]均值滤波');
subplot(2,3,5),
imshow(filtered_9_9),title('[9,9]均值滤波');
subplot(2,3,6),
imshow(filtered_13_13),title('[13,13]均值滤波');

% 输出滤波后图像到文件
imwrite(filtered_std,'filtered_std.png');
imwrite(filtered_5_5,'filtered_5_5.png');
imwrite(filtered_9_9,'filtered_9_9.png');
imwrite(filtered_13_13,'filtered_13_13.png');