//
//  NSData+AES.h
//  Smile
//
//  Created by apple on 15/8/25.
//  Copyright (c) 2015年 Weconex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (NEUAES)

- (NSData *)AES128EncryptWithKey:(NSString *)keyer ;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)keyer ;   //解密

@end
