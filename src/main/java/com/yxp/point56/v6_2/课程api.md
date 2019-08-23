# 课程api
## 1. 课程列表
### 接口路径
```http request
POST /course/list
```
### 请求参数
#### body
```json
{
  "pageNo": 1,
  "pageSize": 10,
  "schoolId": "1"
}
```
`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| pageNo | true |  number | 页码(>0 && <=100 的正整数，即最多到100页) |
| pageSize | true |  number | 每页数量(>0 && <=30 的正整数，即每页数量最多显示30) |
| schoolId | true |  string | 分校id |

### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {
      "pageNo": 1,
      "pageSize": 10,
      "totalCount": 1,
      "totalPage": 1,
      "list": [ // 当页数据
          {
            "id": "1", // 课程id
            "courseName": "课程A" // 课程名称
          }
      ]
  }  
}
```

### 错误码信息
`参见错误码说明`


## 2. 订阅课程

### 接口路径
```http request
POST /course/subscribe
```
### 请求参数
#### body
```json
{
  "userId": "65464651651",
  "courseId": "1029690808967720962",
  "schoolId": "1",
  "validStart": "2018-10-30",
  "validEnd": "2019-09-03"      
}
```
`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |   
| userId | true |  string | 用户id |
| courseId | true |  string | 课程id(只能订阅学生所在分校的课程) |
| schoolId | true |  string | 分校id |
| validStart | true |  string | 课程有效期开始时间(格式约束：yyyy-MM-dd) |
| validEnd | true |  string | 课程有效期结束时间(格式约束：yyyy-MM-dd) |
`注意：时间参数需要满足 validStart <= validEnd，validEnd >= 当前时间`

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
| 1101 | 课程有效期起止时间不符合规范 |  |
| 1102 | 该学生已经订阅了该课程，请不要重复订阅 |  |
| 1103 | 订阅的课程未启用或不存在 |  |
| 1105 | 该学生不在该分校，不能订阅该分校的课程 |  |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |
`其它错误信息请参见错误码说明`

## 3. 修改订阅课程

### 接口路径
```http request
POST /course/updateSubscribe
```
### 请求参数
#### body
```json
{
  "userId": "65464651651",
  "courseId": "1029690808967720962",
  "schoolId": "1",
  "validStart": "2018-10-30",
  "validEnd": "2019-09-03"      
}
```

`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |   
| userId | true |  string | 用户id |
| courseId | true |  string | 课程id |
| schoolId | true |  string | 分校id |
| validStart | true |  string | 课程有效期开始时间(格式约束：yyyy-MM-dd) |
| validEnd | true |  string | 课程有效期结束时间(格式约束：yyyy-MM-dd) |
`注意：时间参数需要满足 validStart <= validEnd，validEnd >= 当前时间`

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
| 1101 | 课程有效期起止时间不符合规范 |  |
| 1103 | 订阅的课程未启用或不存在 |  |
| 1104 | 该学生没有订阅该课程 |  |
| 1106 | 当前学生不存在 | 该学生用户已经被删除或禁用 |
`其它错误信息请参见错误码说明`
