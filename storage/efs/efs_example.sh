# 创建一个文件系统
aws efs create-file-system --creation-token my-efs-file-system
# 创建挂载目标
aws efs create-mount-target --file-system-id fs-0317362afe0e953d0 --subnet-id subnet-1ff75945 --security-groups sg-3dbc8777
# 创建挂载目录
sudo mkdir /mnt/efs
# 挂载
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0abe46534aee352b8.efs.us-west-1.amazonaws.com:/ /mnt/efs
# 解除挂载
sudo umount /mnt/efs
# 如果解除挂载时提醒device is busy，可以利用lsof命令查看正在访问目录的进程
lsof | grep /dev/efs
# 删除挂载目标
aws efs delete-mount-target --mount-target-id fsmt-006c78825a2a638fc
# 删除EFS
aws efs delete-file-system --file-system-id fs-0317362afe0e953d0