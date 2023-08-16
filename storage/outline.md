# aws上的三种存储，从底层到上层
## 简单介绍三种存储
### EBS Elastic Block Store
- [official doc](https://docs.aws.amazon.com/zh_cn/ebs/)
- [sns console (us-east-1)](https://us-west-1.console.aws.amazon.com/ec2/home?region=us-west-1#Volumes:)
## web console实操
ec2 示例会有一个root ebs卷，相当于电脑的系统盘
- 新建EBS卷
- 将EBS卷附加到ec2 instance
- 在ec2上格式化，挂载ebs
    - lsblk查看块设备
    - sudo mkfs -t ext4 /dev/name
    - sudo mkdir /mnt/ebs-volume
    - sudo mount /dev/name /mnt/ebs-volume

## [boto3实操](sns_example.ipynb)
[代码来自于aws官方sdk实例](https://github.com/awsdocs/aws-doc-sdk-examples)

运行前需要修改代码中的topic_name和subscribe_url的值
- 创建topic
- 创建subscription
- 发布通知
- 删除topic和subscription

### EFS Elastic File System
### S3 Simple Storage Service



    权限控制
    底层原理
    应用举例