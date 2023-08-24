# aws上的三种存储，从底层到上层

## EBS Elastic Block Store
- [official doc](https://docs.aws.amazon.com/zh_cn/ebs/)
- [ebs console (us-west-1)](https://us-west-1.console.aws.amazon.com/ec2/home?region=us-west-1#Volumes:)

ebs是aws上最基础的存储服务，每一台ec2 instance都离不开一个ebs卷作为它的系统盘，称为根卷（root volume）。一般情况下根卷的生命周期是跟随ec2实例的，当我们terminate一个ec2实例的时候，它的根卷也会同时被销毁。为了持久保存数据，我们可以给ec2实例附加额外的EBS卷。

EBS卷在附加到ec2实例上之后体现为系统中的一个块设备，我们可以把它当作一块硬盘来对待，需要对他进行分区，格式化，挂载等操作。当然它实际上肯定不是一块物理硬盘。ebs可以进行快照操作，保存某个时间点的所有文件状态，在必要时可以进行恢复。通常情况下一个ebs卷在同一时刻只能挂载在一个ec2实例上，但是有特定类型的ebs在特定区域的特定类型ec2上支持多重挂载，即同一个ebs卷同时挂载在多个ec2实例。详情可以参考[aws文档](https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/ebs-volumes-multi.html)

我们可以对ebs进行扩容，在扩容以后需要在系统中对块设备进行分区操作，比如扩展当前分区或者新建分区，才可以使用到新增的容量。

块存储设设备举例：硬盘，U盘
非块存储的例子：磁带

## web console实操
- 新建EBS卷
- 将EBS卷附加到ec2 instance
- 在ec2上格式化，挂载ebs
    - lsblk查看块设备
    - sudo mkfs -t ext4 /dev/name
    - sudo mkdir /mnt/ebs-volume
    - sudo mount /dev/name /mnt/ebs-volume
- 在ec2上解除挂载ebs
    - sudo umount /mnt/ebs-volume

## [boto3实操](ebs/ebs_example.ipynb)
运行前需要修改代码中的instance_id和az的值
- 创建一个EBS卷
- 附加EBS卷到EC2实例
- 挂载EBS卷
- 解除挂载
- 删除EBS卷

## [aws cli实操](ebs/ebs_example.sh)
运行前需要修改代码中的instance_id和az的值
- 创建一个EBS卷
- 附加EBS卷到EC2实例
- 挂载EBS卷
- 解除挂载
- 删除EBS卷

## EFS Elastic File System
- [official doc](https://docs.aws.amazon.com/zh_cn/efs/)
- [ebs console (us-west-1)](https://us-west-1.console.aws.amazon.com/efs/home?region=us-west-1#)

EFS和EBS不同，它在EBS的基础之上为我们提供了一个通过网络访问的文件系统，从aws的文档我们可以确认，EFS采用了nfs协议。与EBS不同，EFS封装了块设备的底层细节。我们创建好相应的资源之后直接挂载就可以使用，不需要像EBS一样进行分区，格式化等操作。而且EFS可以同时挂载在多个ec2实例，
可以方便实例之间共享数据。

EFS既然是通过网络挂载，那么我们就要为他进行相应的网络配置。在efs详情的网络面板中，需要我们给efs创建挂载目标，并且给挂载目标配置子网和安全组。要保证ec2 instance和挂载目标之间的网络可以联通，才可以将EFS挂载到ec2实例。

除了挂载目标，我们还可以给EFS创建接入点。创建接入点，可以认为是在efs的根目录下创建了多个子目录，通过挂载特定的接入点，我们将efs的子目录挂载到efs上。接入点上可以通过指定uid和gid的方式对目录进行权限管理。通过接入点挂载以后，目录下的所有文件的owner和group体现为我们在接入点上配置的用户。

如果要对efs进行更精细的权限控制，除了通过安全组，子网等方式控制接入权限，还可以利用File System Policy。通过编写File System Policy，我们可以控制允许接入EFS的读写权限，比如挂载后只读或者刻写；允许或拒绝某个IAM Role通过某个接入点挂载EFS等。

## [boto3实操](efs/efs_example.ipynb)
- 创建一个文件系统
- 创建挂载目标
- 删除EFS

## [aws cli实操](efs/efs_example.sh)
- 创建一个文件系统
- 创建挂载目标
- 创建挂载目录
- 删除挂载点
- 删除EFS

## S3 Simple Storage Service
- [official doc](https://docs.aws.amazon.com/zh_cn/s3/)
- [s3 console (global)](https://s3.console.aws.amazon.com/s3/home?region=us-west-1#)

S3是一种对象存储服务，它相比EBS和EFS进行了进一步的封装。使用EBS，我们通过ec2 instance访问一个块设备；使用EFS，我们通过ec2 instance访问一个文件系统；使用S3，我们访问的是文件对象。

经过一定的配置，s3中的文件可以直接通过互联网访问，我们甚至可以利用s3托管一个静态网站。详情可以参考[aws文档](https://docs.aws.amazon.com/zh_cn/AmazonS3/latest/userguide/WebsiteHosting.html)

S3中的基本存储单元是存储桶（bucket），组织资源的基本概念是对象。存储桶的名字在整个aws中是唯一的，我们通过在桶中存放对象来组织我们的资源。每一个对象拥有一个key，我们可以通过它所在的bucket和它的key来进行定位。

使用EBS时，我们可以对卷进行快照；使用EFS时，我们可以将它备份到S3，或者在另一个region创建一个只读的replication file system；而S3我们可以对bucket开启版本控制，为其中的每一个对象开启自己独立的版本控制。每次对对象的修改都会生成一个新的版本，可以随时恢复。

## [boto3实操](efs/efs_example.ipynb)
- 创建一个bucket
- 上传文件
- 下载文件
- 查看文件列表
- 删除文件
- 删除bucket

## [aws cli实操](efs/efs_example.sh)
- 创建一个bucket
- 上传文件
- 下载文件
- 删除文件
- 删除bucket
