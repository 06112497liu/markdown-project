# 用户api
## 1. 创建学生

### 接口路径

```http
POST /student/create
```

### 请求参数

#### Body

```json
{
  "name": "五",
  "password": "fgasdfasdf12121215",
  "sex": 1,
  "birthday": "2000-10-01",
  "email": "8049126456@qq.com",
  "idNumber": "510781111111111111",
  "mobile": "15222222222",
  "avatar": "/weinx/1.png",
  "address": "天府一街",
  "school": "育才中学",
  "grade": "一年级",
  "className": "6班",
  "status": 1,
  "studentSchoolRoleList": [
    {
      "schoolId": "1",
      "courseList": [
        {
          "courseId": "1067226421664968706",
          "validStart": "2019-06-27",
          "validEnd": "2019-07-28"
        }
      ]
    }
  ]
}
```
#####`body请求参数说明`
| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| name | true |  string | 学生姓名(不超过45个字符长度) |
| password | true |  string | 密码(目前是明文密码) |
| sex | false | number  | 性别：1.男，2.女，0 未设置 |
| birthday | false |  string | 出生年月(格式约束：yyyy-MM-dd) |
| email | false |  string | 邮箱(不超过100个字符长度) |
| idNumber | false |  string | 身份证号(不超过45个字符长度) |
| mobile | false |  string | 电话 |
| avatar | false |  string | 头像url地址(不超过100个字符长度) |
| address | false |  string | 用户家庭地址 |
| school | false |  string | 用户就读的学校(行政学校)，区别于56点学校(不超过100个字符长度) |
| grade | false |  string | 年级(不超过45个字符长度) |
| className | false | string  | 班级(不超过45个字符长度) |
| status | false |  number | 1:可用，0：禁用 |
| studentSchoolRoleList | true |  array | 学生所在分校信息（目前只支持一个分校） |
| schoolId | true |  string | 分校id |
| courseList | false(true) |  number | 学生订阅的课程（添加学生时，可以不订阅课程，但学生一定要和分校关联） |
| courseId | false(true) |  string | 订阅所在分校的课程id |
| validStart | false(true) |  date | 课程有效期开始时间 |
| validEnd | false(true) |  date | 课程有效期结束时间 |
`注意：时间参数需要满足 validStart <= validEnd，validEnd >= 当前时间`


### 返回参数

```json
{
  "errcode": 0,
  "errmsg": "ok",  
  "data": {
      "userId": "65461615", // 用户id
      "loginnum": "s555" // 登录号
  }
}
```

### 错误码信息
| errcode | errmsg  | 说明 |
| --- | --- | --- |
| 1101 | 课程有效期起止时间不符合规范 |  |
| 1103 | 订阅的课程未启用或不存在 |  |
`其它错误信息请参见错误码说明`

## 2. 修改学生信息

### 接口路径

```http
POST /student/update
```

### 请求参数

#### Body
```json
{
  "id": "468496489645",
  "name": "张三",
  "sex": 1,
  "birthday": "2000-10-01",
  "email": "8049126456@qq.com",
  "idNumber": "510781111111111111",
  "mobile": "15222222222",
  "avatar": "/weinx/1.png",
  "address": "天府一街",
  "school": "育才中学",
  "grade": "一年级",
  "className": "6班",
  "status": 1
}
```
`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| id | true |  string | 学生id |
| name | false |  string | 学生姓名(不超过45个字符长度) |
| sex | false | number  | 性别：1.男，2.女，0 未设置 |
| birthday | false |  string | 出生年月(格式约束：yyyy-MM-dd) |
| email | false |  string | 邮箱(不超过100个字符长度) |
| idNumber | false |  string | 身份证号(不超过45个字符长度) |
| mobile | false |  string | 电话 |
| avatar | false |  string | 头像url地址(不超过100个字符长度) |
| address | false |  string | 用户家庭地址 |
| school | false |  string | 用户就读的学校(行政学校)，区别于56点学校(不超过100个字符长度) |
| grade | false |  string | 年级(不超过45个字符长度) |
| className | false | string  | 班级(不超过45个字符长度) |
| status | false | number | 1:可用，0：禁用 |

### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {}
}
```

### 错误码信息
| errcode | errmsg  | 说明 |
| --- | --- | --- |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |
`其它错误信息请参见错误码说明`


## 3. 删除学生
### 接口路径
```http
POST /student/delete
```
### 请求参数
#### body
```json
{
  "id": "65461615"
}
```

`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| id | true |  string | 学生id |

### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {}
}
```

### 错误码信息
| errcode | errmsg  | 说明 |
| --- | --- | --- |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |
`其它错误信息请参见错误码说明`

## 4. 学生详情

### 接口路径
```http
POST /stduent/detail
```

### 请求参数
#### body
```json
{
  "id": "65461615"
}
```

`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| id | true |  string | 学生id |

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

### 错误码信息
| errcode | errmsg  | 说明 |
| --- | --- | --- |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |

## 5. 修改学生密码

### 接口路径
```http request
POST /student/password/update
```

### 请求参数
```json
{
  "userId": "5465465",
  "password": "123456"
}
```

`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| userId | true |  string | 用户id |
| password | true |  string | 密码(目前为明文密码) |

### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {}
}
```

### 错误码信息
| errcode | errmsg  | 说明 |
| --- | --- | --- |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |
`其它错误信息请参见错误码说明`