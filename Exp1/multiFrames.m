mri=uint8(zeros(128,128,1,27)); 	% 27帧文件mri.tif初始化
  for frame=1:27
    [mri(:,:,:,frame),map]=imread('mri.tif',frame); % 读入每一帧
  end
figure;imshow(mri(:,:,:,3),map);         	% 显示第3帧
figure,imshow(mri(:,:,:,6),map);  	% 显示第6帧
figure,imshow(mri(:,:,:,10),map); 	% 显示第10帧
figure,imshow(mri(:,:,:,20),map); 	% 显示第20帧

figure;
hold on;
for frame=1:27
    imshow(mri(:,:,:,frame),map); % 读入每一帧
    pause(0.1)
end
hold off
