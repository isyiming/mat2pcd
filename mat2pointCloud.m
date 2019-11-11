function ptCloud=mat2pointCloud(flow,color)
% ��һ����ά����ת����Matlab��pointCloud
% ʹ�õ���matlab�ĵ��ƴ������䣺
%       https://ww2.mathworks.cn/help/vision/lidar-and-point-cloud-processing.html?s_tid=CRUX_lftnav
% ���룺
%       flow��Ϊһ����ά���󣬷�0��������
%       color��Ϊ��������Ԫ�ص��������ֱ����r g b
% �����
%       ptCloud pointCloud��ʽ������
% Author : Ming, 11/4/2019
    th=0;
    flow = imbinarize(flow,th);%��ֵ��'adaptive'
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
    
%     pcwrite(ptCloud,'ptCloud.pcd','Encoding','ascii');%matlab�ṩ�˵��Ʊ���Ϊpcd�ļ��ĺ���
%     ptCloud = pcread('ptCloud.pcd');%��ȡ����

end