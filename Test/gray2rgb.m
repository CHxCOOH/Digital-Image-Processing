function R=gray2rgb(I_gray,I_dst)
% gray2rgb函数，寻找目标图像中灰度接近的点，逐像素为灰度图像填充颜色。
    tic;
    % 色彩通道扩展
    I_gray(:,:,2) = I_gray(:,:,1); % 复制灰度信息到所有三个通道
    I_gray(:,:,3) = I_gray(:,:,1);

    % 色彩空间转换
    I_d = rgb2ycbcr(I_dst);
    I_g = rgb2ycbcr(I_gray);

    ms=double(I_d(:,:,1));
    mt=double(I_g(:,:,1));
     
    d1=max(max(ms))-min(min(ms));
    d2=max(max(mt))-min(min(mt));
    
    % 标准化
    dx1=ms;
    dx2=mt;
    dx1=(dx1*255)/(255-d1);
    dx2=(dx2*255)/(255-d2);
    [mx,my,~]=size(dx2);
    
    nimage = uint8(zeros(mx, my, 3));
    % 灰度匹配
    for i=1:mx
        for j=1:my
            iy=dx2(i,j);
            tmp=abs(dx1-iy);
            % 寻找目标图像中灰度最为接近的点
            ck=min(min(tmp));
            [r,c] = find(tmp==ck);
            ck=isempty(r);
            if (ck~=1)            
                nimage(i,j,2)=I_d(r(1),c(1),2);
                nimage(i,j,3)=I_d(r(1),c(1),3);
                nimage(i,j,1)=I_g(i,j,1);
            end
        end
    end
    result = ycbcr2rgb(nimage);
    R=uint8(result);
    toc;
end