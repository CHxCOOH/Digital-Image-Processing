% 读入lena图，并转换为双精度浮点类型
I = im2double(imread('Lena.png'));
figure,subplot(2,2,1),imshow(I),title("原图");

% 设置运动模糊位移、角度
len=30;
theta=90;

% 生成运动算子、卷积滤波，并展示图像
PSF=fspecial('motion',len,theta);
blurred = imfilter(I,PSF,'conv','circular');

noise_mean = 0;
noise_var = 0.001;
blurred = imnoise(blurred,'gaussian',noise_mean, noise_var);

subplot(2,2,2),imshow(blurred),title('叠加高斯噪声的运动模糊图像');
imwrite(blurred,'Blurred.png');

% 维纳滤波函数deconvwnr没有参数NSPR时，为逆滤波
J1 = deconvwnr(blurred,PSF);
subplot(2,2,3),imshow(J1),title('尝试逆滤波还原');
imwrite(blurred,'Restoration_of_Blurred.png');

% 维纳滤波还原
estimated_nsr = noise_var / var(I(:));
J1 = deconvwnr(blurred,PSF,estimated_nsr);
subplot(2,2,4),imshow(J1),title('尝试维纳滤波还原');
imwrite(blurred,'Restoration_of_Blurred_Estimated.png');