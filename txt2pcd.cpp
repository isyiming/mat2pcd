#include<iostream>
#include <opencv2/core/core.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <stdlib.h>
using namespace std;
using namespace cv;

typedef pcl::PointXYZRGBA PointT;
typedef pcl::Pointcloud<PointT> PointCloud;
vector<cv::Point3f> pts_obj;
PointCloud::Ptr cloud(new PointCloud);
PointCloud::Ptr cloud_filtered(new PointCloud);
PointT p;

int main()
{
	ifstream myfile("data.txt");
	assert(myfile.is_open());
	string temp;
	long int i=0;
	long int j=0;
	long int k=0;
	long int loop=0;

    int size[3];//width height deepth
    for(int i=0;i<3;i++)
    {
        double value=0.0;
        value=atof(temp.c_str());
        size[i]=value;
    }
	while (getline(myfile, temp))
	{
        double value=0.0;
        value=atof(temp.c_str());
        
		loop++;
        i=(loop%(501*512))%501;
		j=(loop%(501*512))/512;
		k=loop/(501*512);
        
		p.z = k;
		p.x = i;
		p.y = j;
        p.b = (int)value*255.0;//获取该点颜色，在.mat中矩阵元素范围为0-1，在此映射到0-255
		p.g = (int)value*255.0;
		p.r = (int)value*255.0;
		cloud->points.push_back(p);
	}
	cloud->height = 1;
	cloud->width = cloud->points.size();
	cloud->is_dense = false;
	pcl::io::savePCDFile( "./pointcloud.pcd", *cloud );
	// 清除数据并退出
	cloud->points.clear();
	cout<<"Point cloud saved."<<endl;
	return 0;
}

