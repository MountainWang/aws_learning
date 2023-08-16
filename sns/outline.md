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
