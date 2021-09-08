# 简介

ShaneKingFriendly 是一套快速开发的 Java 框架（大家都这么说，其实也就是一套固定思维的逻辑代码）

| \ |  | ling | roc | leon |
| :--- | :--- | :--- | :--- | :--- |
|  |  | Java | Spring | SpringWeb |
| zero | Zero Dependency | ✔ | ✔ |  |
| persistence | OR Mapping | ✔ | ✔ | ✔ |
| rr | Request and Response | ✔ | ✔ | ✔ |
| test | Test Tools | ✔ | ✔ | ✔ |
| --- | --- | --- | --- | --- |
| jackson |  | ✔ | ✔ |  |
| jsqlparser |  | ✔ |   |  |
| logback |  | ✔ |   |  |
| swagger |  |  |  | ✔ |

# 注意事项

- 如果启用 Entity 缓存（`sk.roc.persistence.entity.cache.enabled=true`），务必使用 CacheableDao 操作，如直接操作（修改）数据库，容易造成`缓存数据`与`数据库数据`不一致问题

# 版本日志

版本号严格遵守语义化版本2.0.0协议（<https://semver.org/lang/zh-CN>）

## 0.254.10.Friendly

### Highlights

- 尽可能少的使用`parallelStream`，防止`InheritableThreadLocal`串数据等情况
- 尽可能少的使用`ThreadLocal`及`InheritableThreadLocal`等，提升代码可读性

### Bugfix

- rr
  - 修复限流切面问题：`putIfAbsent`改为`computeIfAbsent`

### Optimization

- persistence
  - 重命名字段名称并调整字段长度：涉及`version`改为`ver`；`invalid`改为`ivd`；`lastModifyDateTime`改为`lmDsz`（并扩至30位，存储带有时区的时间）；`lastModifyUserId`改为`lmUid`
  - 支持`insert`空字符串
  - 重命名`OpenVisible`为`Shared`
- rr
  - 请求级别的鉴权调整：支持平台级接口授权（系统越过租户，直接授权给渠道）
  - `pub.tenantNo`改为`pri.ext.tenantNo`：防止关键数据被串改

### Features

- zero
  - 新增分布式锁：基于`NFS`等协议的分布式文件锁，以及基于`数据库`无续约管理的分布式数据锁
- persistence
  - 新增业务编号`no`：作为业务主键（有时需与租户联合形成唯一索引），与系统主键`id`区分，以保证`id`的无逻辑干扰自增性
  - 新增软删除`dd`：所有唯一索引需添加该属性，以便数据在业务上的可重复性，可重建性
- rr
  - 新增需回滚异常`RbkRespException`：支持统一回滚
  - 支持请求级别的防重放（新增`pri.ext.dsz`，含时区时间戳`yyyy-MM-dd HH:mm:ss.SSSXXX`，响应时更新）/异步（新增`pri.ext.async`，大于`0`表示开启异步并本次最长等待时间）/消息校验码（新增`pub.mvc`对密文校验，响应时更新）

## 0.241.2.Friendly

### Optimization

- zero
  - `Crypto0`重命名为`SKC1`：以便后续新增更多的加解密算法
- rr
  - `tracingId`重命名为`tracingNo`：业务标记，体现业务性

## 0.241.1.1

### Features

- persistence
  - 支持单表增删改查操作
  - 支持缓存：如开启缓存，默认按`id`缓存。**注意：如启用缓存，请不要在直接修改数据库，以免造成`缓存数据`与`数据库数据`不一致问题**
- rr
  - **统一请求响应报文**
  - 支持请求级别的审计（同步插请求响应日志表）/限流（按接口超并发拒绝请求）/鉴权（判断渠道是否有调用该接口权限）/加解密（解密请求加密响应）/缓存（按人级别）
