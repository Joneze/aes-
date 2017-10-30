//
//  ViewController.m
//  AES加密_Demo
//
//  Created by Lix on 16/9/21.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "ViewController.h"
#import "NEUSecurityUtil.h"


@interface ViewController ()
@property(nonatomic,strong)UIWebView *web;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     * 将被加密的字符串
     * 秘钥已经在 NEUSecurityUtil 类中设置好
     */
    NSString *str = @"phone=13362933377&name=中国&pid=358&t=1443168027&token=2asdfjdfa&name=浙江&address=杭州&room=322&baby=anglababy&commmdr=sasdfcccc&right=yes&test=11+-";
    NSString *encryptStr = [NEUSecurityUtil neu_encryptAESData:str];
    NSLog(@"加密后的字符串 = %@", encryptStr);
    
    
    NSString *decryptStr = [NEUSecurityUtil neu_decryptAESData:encryptStr];
    NSLog(@"解密后的字符串 = %@", decryptStr);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
