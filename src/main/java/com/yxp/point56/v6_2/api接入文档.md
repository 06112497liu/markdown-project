# api接入文档
## 获取app_key 与 app_secret
    联系56点方，获取app_key 和 app_secret。
## ip白名单
    联系56点方，申请加入ip白名单
## 接口权限
    联系56点方，申请app_key对应的接口权限
## 重要参数说明
### 1. exp
```text
    exp为调用方的当前时间戳，这个时间戳会在56点方进行校验，有效期目前设置为1分钟，后期根据实际情况可以调整。
```
### 2. request_id
```text
    该参数（可理解为调用的流水号）由调用端来保证，确保每次调用的request_id不同，用来进行对账。
```
### 3. app_key
```text
    调用方申请的app_key，服务端会校验这个app_key是否是56点签发的。
```
### 4. app_secret
```text
    app_key对应的密钥，app_key和app_secret是一一对应的，调用时不应该传入，构建签名时需要用到。注意不要泄露。
```
### 5. sign
```text
    签名，就是将字符串  body + appSecret + appKey + exp + requestId，这几个参数按照这个顺序拼接成字符串，进行 SHA-512 进行签名，
    得到128位的字符串。然后调用时通过header传入。56点方会用同样的方式构建签名，从而进行校验。
```
**注意：签名的json body一定要去除空格、换行符、制表符**
## 接入示例
### 获取学生详情接口为例
```http request
POST /stduent/detail
```
```java
class Demo {
    public void test() throws Exception {
        // 时间戳
        long exp = System.currentTimeMillis();
        
        // 所有参数都是json格式（注意：并且在构建签名时，需要去掉空格、换行符、制表符）
        String param = "{\"id\":\"1145593355231739905\"}";
        
        HttpRequest request = new HttpRequest("http://127.0.0.1:7151/v6/third/open/student/detail");
        // 所有请求都是post请求
        request.method(Method.POST);
        
        // body的格式
        request.contentType("application/json");
        request.body(param);
        
        // 签名
        String sign = this.createSign("your app_key", "your request_id", exp, param, "your app_secret");
        
        // 4个head（注意：app_secret不需要传入）
        request.header("exp", String.valueOf(exp));
        request.header("app_key", "your app_key");
        request.header("request_id", "your app_secret");
        request.header("sign", sign);
        
        HttpResponse response = request.execute();
    }

    // 构建签名
    private String createSign(String appKey, String requestId, Long exp, String body, String appSecret) 
    throws Exception {
        StringBuilder sb = new StringBuilder();
        // 签名的字符串一定要按照这个顺序来
        sb.append(body)
            .append(appSecret)
            .append(appKey)
            .append(exp)
            .append(requestId);
        // 签名字符串采用 SHA-512 算法来加密
        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        digest.update(sb.toString().getBytes("UTF-8"));
        byte[] bytes = digest.digest();
        StringBuffer stringBuffer = new StringBuffer();
        String temp;
        for (int i = 0; i < bytes.length; i++) {
            temp = Integer.toHexString(bytes[i] & 0xFF);
            if (temp.length() == 1) {
                // 1得到一位的进行补0操作
                stringBuffer.append("0");
            }
            stringBuffer.append(temp);
        }
        return stringBuffer.toString();
    }
}
```