function ptCloud=mat2pointCloud(flow,color)
% 将一个三维矩阵转换成Matlab的pointCloud
% 使用到了matlab的点云处理工具箱：
%       https://ww2.mathworks.cn/help/vision/lidar-and-point-cloud-processing.html?s_tid=CRUX_lftnav
% 输入：
%       flow：为一个三维矩阵，非0点代表点云
%       color：为包含三个元素的向量，分别代表r g b
% 输出：
%       ptCloud pointCloud格式的数据
% Author : Ming, 11/4/2019
    th=0;
    flow = imbinarize(flow,th);%二值化'adaptive'
    xyzPoints=zeros(sum(flow(:)),3);
    xyzColor= zeros(sum(flow(:)),3);
    
    count=0;
    [height,width,deepth] = size(flow);
    for jj=1:width
        jj
        for kk=1:deepth
            for ii=1:1:height
                if flow(ii,jj,kk)>0.0
                    count=count+1;
                    xyzPoints(count,:)=[ii,jj,kk];
                    xyzColor(count,:)=color.*flow(ii,jj,kk);
                end
            end
        end
    end
    ptCloud = pointCloud(xyzPoints,'Color',xyzColor);
    
%     pcwrite(ptCloud,'ptCloud.pcd','Encoding','ascii');%matlab提供了点云保存为pcd文件的函数
%     ptCloud = pcread('ptCloud.pcd');%读取函数

end