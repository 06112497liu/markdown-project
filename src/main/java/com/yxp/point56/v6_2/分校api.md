# 分校api
## 1.分校列表
### 接口路径
```http request
POST /school/list
```
### 请求参数
#### body
```json
{
  "pageNo": 1,
  "pageSize": 10, 
  "schoolName": "四川五六点学校"
}
```
`body请求参数说明`

| 参数 | 是否必须 | 类型 | 说明 |
| --- | --- | --- | --- |
| pageNo | true |  number | 页码(>0 && <=100 的正整数，即最多到100页) |
| pageSize | true |  number | 每页数量(>0 && <=30 的正整数，即每页数量最多显示30) |
| schoolName | false |  string | 分校名称模糊查询 |

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
      "list": [
          {
            "id": "1", // 分校id
            "schoolName": "四川五六点学校" // 分校名称
          }
      ]
  }
}
```

### 错误码信息
`参见错误码说明`

