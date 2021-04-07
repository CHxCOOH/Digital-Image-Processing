% 常量
NAME = 'cameraman';

% 读入图像
img = imread('cameraman.tif');

% 叠加噪声并保存图片
noised = imnoise(img, 'gaussian', 0, 0.01);
imwrite(noised, 'cameraman_noised.png');

% 展示图片
f1 = figure;
subplot(2,2,1), imshow(img), title('原图');
subplot(2,2,2), imshow(img), title('叠加高斯噪声');

% 低通滤波准备
imgD = im2double(noised);      % 转换double
imgF = fftshift(fft2(imgD));      % 傅里叶变换,将原点移至矩形中心 
[M,N] = size(imgF);

lpf(50, 3, M, N, imgF);
lpf(100, 4, M, N, imgF);

function lpf(dist, figureNum, M, N, imgF)
    z = zeros(M,N);
    for i = 1:M 
        for j = i:N 
            if(sqrt(((i-M/2)^2+(j-N/2)^2)) < dist) 
                z(i,j) = 1; 
            end 
        end 
    end
    imgLPF = imgF.*z;
    imgLPF = real(ifft2(ifftshift(imgLPF)));
    imwrite(imgLPF, strcat('cameraman',num2str(dist),'.png')); % 输出图像
    subplot(2,2,figureNum), imshow(imgLPF), title(strcat('cameraman',num2str(dist)));
end

