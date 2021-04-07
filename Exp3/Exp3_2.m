% 常量
NAME = 'cameraman';

% 读入图像并转换
img = imread('cameraman.tif');
img = im2double(img);


% 掩模
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];

% 离散余弦变换
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(img,[8 8],dct);

% 丢弃8*8矩阵的大部分系数，仅保留左上的10个
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);

% 使用每个数据块的二维逆 DCT 重构图像
invdct = @(block_struct) T' * block_struct.data * T;
img_compressed = blockproc(B2,[8 8],invdct);

% 保存、展示图像
imwrite(img_compressed,strcat(NAME,'_compressed.png'));

figure;
subplot(1,2,1),imshow(img),title('原图');
subplot(1,2,2),imshow(img),title('压缩');