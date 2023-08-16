az=us-west-1b
instance_id=i-07790de3c13887ce4
# 创建EBS卷：
aws ec2 create-volume --size 10 --availability-zone $az
# 附加EBS卷到EC2实例：
aws ec2 attach-volume --volume-id your-volume-id --instance-id $instance_id --device /dev/sdf
# 查看示例的块设备
lsblk
# 格式化
sudo mkfs -t ext4 /dev/sdf
# 创建挂载点
sudo mkdir /mnt/ebs-volume
# 挂载
sudo mount /dev/name /mnt/ebs-volume
# 解除挂载
sudo umount /mnt/ebs-volume
# 分离EBS卷：
aws ec2 detach-volume --volume-id your-volume-id
# 删除EBS卷：
aws ec2 delete-volume --volume-id your-volume-id