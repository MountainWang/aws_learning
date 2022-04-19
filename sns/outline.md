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


# sns
- [official doc](https://docs.aws.amazon.com/zh_cn/sns/latest/dg/welcome.html)
- [sns console (us-east-1)](https://us-east-1.console.aws.amazon.com/sns/v3/home?region=us-east-1#/dashboard)
## web console实操
- 创建topic
- 创建subscription
    - [介绍不同endpoint Protocol](https://docs.aws.amazon.com/zh_cn/sns/latest/dg/sns-create-subscribe-endpoint-to-topic.html)
    - 使用http endpoint
        - [准备http server](aws_sns_listener.py)
        - http endpoit的确认
- 发布通知
    - 查看http server收到的请求
- 删除topic和subscription

## [boto3实操](sns_example.ipynb)
[代码来自于aws官方sdk实例](https://github.com/awsdocs/aws-doc-sdk-examples)

运行前需要修改代码中的topic_name和subscribe_url的值
- 创建topic
- 创建subscription
- 发布通知
- 删除topic和subscription
