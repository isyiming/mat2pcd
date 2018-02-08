fid=fopen('data.txt','w')%打开要写入数据的txt文件
[width,height,deepth]=size(FloE)%获取mat矩阵的大小，FloE为mat矩阵的句柄
fprintf(fid,'%d',width)
fprintf(fid,'%d',height)
fprintf(fid,'%d',deepth)
for i=1:(width*height*deepth)
value=FloE(i)
fprintf(fid,'%d\r\n',value)%注意打印回车方式
End
close%关闭txt文件句柄
