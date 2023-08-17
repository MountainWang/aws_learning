# 创建存储桶（Bucket）：
aws s3 mb s3://mtw-bucket-002
# 上传对象（Object）到存储桶：
aws s3 cp example.txt s3://mtw-bucket-002/
# 列出对象版本：
aws s3api list-object-versions --bucket mtw-bucket-002 --prefix example.txt
# 下载对象：
aws s3 cp s3://mtw-bucket-002/example.txt example.txt.download
# 删除对象：
aws s3 rm s3://mtw-bucket-002/example.txt
# 删除存储桶：
aws s3 rb s3://mtw-bucket-002