# 用户api
## 1.创建学生

### 接口路径

```http
POST /student/create
```

### 请求参数

#### Headers
| 请求头 | 值 | 是否必填 | 说明 |
| --- | --- | --- | --- |
| Content-Type | application/json | true |  |


#### Body

```json
{
  "name": "张三", // 学生姓名
  "sex": 1, // 性别  
  "birthday": "2000-10-01", // 出生年月(格式约束：yyyy-MM-dd)
  "email": "8049126456@qq.com", // 邮箱
  "mobile": "15222222222", // 电话
  "password": "fgasdfasdf12121215", // 密码(sha256加密：64位)，字母全部小写
  "photo": "/weinx/1.png", // 头像url地址
  "address": "天府一街", // 用户家庭地址
  "school": "育才中学", // 用户就读的学校(行政学校)，区别与56点学校
  "grade": "一年级", // 年级
  "className": "6班", // 班级
  "status": 1, // 1:可用，0：禁用
  "courseList": [
    {
      "validEnd": "2019-09-03", // 课程开始时间(格式约束：yyyy-MM-dd)
      "validStart": "2018-10-30", // 课程结束时间(格式约束：yyyy-MM-dd)
      "courseId": "1029690808967720962" // 课程id
    }
  ]
}
```
##### body请求参数说明
| 参数 | 是否必须  | 说明 |
| --- | --- | --- |
| name | true | 学生姓名 |
| sex | true | 性别：1.男，2.女，0 未设置 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |
| name | true | 学生姓名 |


### 返回参数

```json
{
  "errcode": 0,
  "errmsg": "ok",  
  "data": {
      "userId": 1, // 用户id
      "loginnum": "s555" // 登录号
  }
}
```

## 2.修改学生

### 接口路径

```http
POST /student/update
```

### 请求参数
#### Headers
| 请求头 | 值 | 是否必填 | 说明 |
| --- | --- | --- | --- |
| Content-Type | application/json | true |  |
#### Body
```json
{
  "userId": 1, // 学生id
  "name": "张三", // 学生姓名
  "schoolId": "1041625973289701378", // 校区id
  "userAuthentication": {
      "loginnum": "s54564", // 登录账号
      "password": "21fasd1f2a1sfa15" // 密码(sha256加密：64位)，字母全部小写
  },
  "courseList": [
    {
      "validEnd": "2019-09-03", // 课程有效期开始时间(格式约束：yyyy-MM-dd)
      "validStart": "2018-10-30", // 课程有效期结束时间(格式约束：yyyy-MM-dd)
      "courseId": "1029690808967720962" // 课程id
    }
  ]
}
```
### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {}
}
```
## 3.删除学生
### 接口路径
```http
POST /student/delete
```
### 请求参数
#### body
```json
"65461615" //学生id
```
### 返回参数

```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {}
}
```
## 4.学生详情
### 接口路径
```http
POST /stduent/detail
```
### 请求参数
#### body
```json
"65461615" //学生id
```
### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {
    "id": "1", // 用户id
    "loginnm": "t12345678", // 登录名
    "name": "张三", // 姓名
    "email": "804912544@qq.com", // 邮箱
    "mobile": "13256523", // 电话
    "status": 1, // 1:可用，0：禁用
    "avatar": "https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er5nYMCZlI2rj9Jr3Exg7ibenCicdzmjFGwcQozo8ia3ib5EGVyLYRs92fKJBdp4WBr24R3F7oNPyaAQA/132", // 照片
    "sex": "1", // 性别：1.男，2.女，0 未设置
    "idNumber": "546846546161534", // 身份证号
    "birthday": "2011-02-02", // 出生日期
    "role": 4, // 1.店长；2.教师；4.学生；8.家长；16.服务支持人员
    "address": "四川江油" // 地址
  }
}
```

