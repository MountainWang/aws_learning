# sqs
- [official doc](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [sqs console (us-east-1)](https://us-east-1.console.aws.amazon.com/sqs/v2/home?region=us-east-1#/queues)
- sqs和sns的区别
## web console实操
- 创建queue
- 发送、接收和删除消息
- 从sns订阅消息
- sns发布通知，查看队列
- 删除queue

## [boto3实操](sqs_example.ipynb)
[代码来自于aws官方sdk实例](https://github.com/awsdocs/aws-doc-sdk-examples)

运行前需要修改代码中的queue_name和sns_topic_arn的值
- 创建queue
- 发送、接收和删除消息
- 从sns订阅消息
- sns发布通知，查看队列
- 删除queue
