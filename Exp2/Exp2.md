# 实验二——图像增强与平滑

# 一、实验内容

对图像添加高斯噪声，并利用不同大小的均值滤波平滑图像，观察不同大小的均值模板对含噪图像的影响，提交代码和图片。

# 二、实验过程

## 1. 实验原始图像

这里选取了 MATLAB 自带的 mandi.tif 作为实验图像。

![mandi.tif](./mandi.png "mandi.tif")

```matlab
% 读入图像
mandi = imread('mandi.tif');
```

## 2. 添加高斯噪声

```matlab
% 添加高斯噪声
mandi_noise = imnoise(mandi,'gaussian',0,0.01);
imwrite(mandi_noise, 'mandi_noise.png');  % 写入添加高斯噪声后的图像到文件
```

![mandi_noise.png](./mandi_noise.png "mandi_noise.png")

