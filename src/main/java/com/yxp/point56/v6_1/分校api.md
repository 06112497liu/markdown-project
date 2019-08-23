# 分校api
## 1.分校列表
### 接口路径
```http request
POST /school/list
```
### 请求参数
#### body
```json
"四川五六点学校" // 学校名称
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
      "list": [
          {
            "id": "1", // 学校id
            "schoolName": "四川五六点学校" // 学校名称
          },
          {}, {}
      ]
  }
}
```

