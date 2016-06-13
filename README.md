# 融云IM

融云IM Server API 调用
API文档 http://www.rongcloud.cn/docs/server.html

# 安装

添加下面代码到Gemfile:
```ruby
gem 'alipay', '~> 0.12.0'
```

然后执行：
```console
$ bundle
```

# 配置

```ruby
RongCloudIM.app_key    = 'YOUR APP KEY'
RongCloudIM.app_secret = 'YOUR APP SECRET'
# RongCloudIM.response_type = 'RESPONSE TYPE' # 可选，默认json。可选值： json、xml
```

# 已实现API
- 用户获取 Token
- 刷新用户信息
- 消息历史记录下载地址获取
- 创建群组
- 解散群组
- 刷新群组信息
- 查询群成员

# 使用

```ruby
RongCloudIM::User.get_token user_id: "f1", name: "xxx", portrait_uri: ''
```


