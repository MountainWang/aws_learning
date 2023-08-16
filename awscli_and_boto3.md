# awscli 和 boto3

## aws cli
- shell中操作aws，进行自动化操作
- 可以操作aws的所有接口
- 实践中的应用: 使用 aws s3 从ec2获取日志

### aws cli的安装和credential/region等的配置
- [awscli v1 安装](https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-install.html)
- [awscli v2 安装](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [aws configure (v1)](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-quickstart.html)
    - 查看~/.aws下的文件

### 简单演示aws cli的使用
- aws s3 ls
- aws s3 cp

## boto3
- aws的python sdk
- [credential 的配置](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html)


