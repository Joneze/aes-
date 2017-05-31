iOS端以及Java端的AES加密解密

两种模式已经调通，可以直接用在项目中。

如果有用，感谢Star。

#Usage

---

`#import "NEUSecurityUtil.h"`

```/*
    * 将被加密的字符串
    * 秘钥已经在 NEUSecurityUtil 类中设置好
    */
    NSString *str = @"phone=13362922277&name=中国&pid=358&t=1443168027&token=2asdfjdfa&name=浙江&address=杭州&room=322&baby=anglababy&commmdr=sasdfcccc&right=yes&test=11+-";
    NSString *encryptStr = [NEUSecurityUtil neu_encryptAESData:str];
    NSLog(@"加密后的字符串 = %@", encryptStr);


    NSString *decryptStr = [NEUSecurityUtil neu_decryptAESData:encryptStr];
    NSLog(@"解密后的字符串 = %@", decryptStr);
    
```
