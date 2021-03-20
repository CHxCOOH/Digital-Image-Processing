f = zeros(30,30);
f(5:24,13:17) = 1;
figure,imshow(f,'InitialMagnification','fit');
F = fft2(f);
F2 = log(abs(F));
figure,imshow(F2,[-1 5],'InitialMagnification','fit');
F=fft2(f,256,256); %零填充为256×256矩阵
figure,imshow(log(abs(F)),[-1 5],'InitialMagnification','fit');
F2=fftshift(F);    %将图像频谱中心由矩阵原点移至矩阵中心
figure,imshow(log(abs(F2)),[-1 5],'InitialMagnification','fit');
