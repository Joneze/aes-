//
//  NSData+AES.h
//  Smile
//
//  Created by apple on 15/8/25.
//  Copyright (c) 2015年 Weconex. All rights reserved.
//

#import "NSData+NEUAES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (NEUAES)



- (NSData *)AES128EncryptWithKey:(NSString *)keyer{//加密
    
    NSData *key = [keyer dataUsingEncoding:NSUTF8StringEncoding];
    
    //同理，解密中，密钥也是16位的
    const void * keyPtr2 = [key bytes];
//    char (*keyPtr)[32] = keyPtr2;
    
    
    //对于块加密算法，输出大小总是等于或小于输入大小加上一个块的大小
    //所以在下边需要再加上一个块的大小
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/ | kCCOptionECBMode,
                                          keyPtr2, kCCKeySizeAES128, //这里修改的是128位加密
                                          NULL,/* 初始化向量(可选) */
                                          [self bytes], dataLength,/*输入*/
                                          buffer, bufferSize,/* 输出 */
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);//释放buffer
    return nil;
}


- (NSData *)AES128DecryptWithKey:(NSString *)keyer{//解密
    
    NSData *key = [keyer dataUsingEncoding:NSUTF8StringEncoding];
    
    //同理，解密中，密钥也是16位的
    const void * keyPtr2 = [key bytes];
//    char (*keyPtr)[32] = keyPtr2;
    
    //对于块加密算法，输出大小总是等于或小于输入大小加上一个块的大小
    //所以在下边需要再加上一个块的大小
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/ | kCCOptionECBMode,
                                          keyPtr2, kCCKeySizeAES128,
                                          NULL,/* 初始化向量(可选) */
                                          [self bytes], dataLength,/* 输入 */
                                          buffer, bufferSize,/* 输出 */
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

@end
