# 课程api
## 1.课程列表
### 接口路径
```http request
POST /course/list
```
### 请求参数
#### body
```json
"1" // 学校id
```
### 返回参数
```json
{
  "errcode": 0,
  "errmsg": "ok",
  "data": {
      "pageNo": 1,
      "pageSize": 10,
      "totalCount": 69,
      "totalPage": 7,
      "list": [ // 当页数据
          {
            "id": "1", // 课程id
            "courseName": "课程A" // 课程名称名称
          },
          {}, {}
      ]
  }  
}
```

