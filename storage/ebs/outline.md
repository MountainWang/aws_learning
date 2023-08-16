# aws上的三种存储，从底层到上层
## 简单介绍三种存储
## EBS Elastic Block Store
- [official doc](https://docs.aws.amazon.com/zh_cn/ebs/)
- [ebs console (us-west-1)](https://us-west-1.console.aws.amazon.com/ec2/home?region=us-west-1#Volumes:)

ebs是aws上最基础的存储服务，每一台ec2 instance都离不开一个ebs卷作为它的系统盘，称为根卷（root volume）。EBS卷在附加到ec2示例上之后体现为系统中的一个块设备，我们可以把它当作一块硬盘来对待，需要对他进行格式化，挂载等操作。

非块存储的例子：磁带

## web console实操
ec2 示例会有一个root ebs卷，相当于电脑的系统盘
- 新建EBS卷
- 将EBS卷附加到ec2 instance
- 在ec2上格式化，挂载ebs
    - lsblk查看块设备
    - sudo mkfs -t ext4 /dev/name
    - sudo mkdir /mnt/ebs-volume
    - sudo mount /dev/name /mnt/ebs-volume
- 在ec2上解除挂载ebs
    - sudo umount /mnt/ebs-volume

## [boto3实操](ebs_example.ipynb)
[代码来自于aws官方sdk实例](https://github.com/awsdocs/aws-doc-sdk-examples)

运行前需要修改代码中的instance_id和az的值
- 创建一个EBS卷
- 附加EBS卷到EC2实例
- 挂载EBS卷
- 解除挂载
- 删除EBS卷
- 删除topic和subscription

## [aws cli实操](ebs_example.sh)
[代码来自于aws官方sdk实例](https://github.com/awsdocs/aws-doc-sdk-examples)

运行前需要修改代码中的instance_id和az的值
- 创建一个EBS卷
- 附加EBS卷到EC2实例
- 挂载EBS卷
- 解除挂载
- 删除EBS卷
- 删除topic和subscription

## EFS Elastic File System
## S3 Simple Storage Service



    权限控制
    底层原理
    应用举例