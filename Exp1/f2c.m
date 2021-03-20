I=imread('cameraman.tif');
I=im2double(I);
T=dctmtx(8);    %DCT变换矩阵
fun1 = @(block_struct) T*block_struct.data*T';
B=blockproc(I,[8,8],fun1);   %分块DCT变换
mask=[1  1  1  1  0  0  0  0
      1  1  1  0  0  0  0  0
      1  1  0  0  0  0  0  0
      1  0  0  0  0  0  0  0
      0  0  0  0  0  0  0  0
      0  0  0  0  0  0  0  0
      0  0  0  0  0  0  0  0
      0  0  0  0  0  0  0  0];
fun2 = @(block_struct) mask.*block_struct.data;
B2=blockproc(B,[8 8],fun2);    %每小块取低频系数
fun3 = @(block_struct) T'*block_struct.data*T;
I2=blockproc(B2,[8 8],fun3);
figure,subplot(1,2,1),imshow(I);title('原始图像');
subplot(1,2,2),imshow(I2);title('离散余弦变换压缩后恢复图像');
