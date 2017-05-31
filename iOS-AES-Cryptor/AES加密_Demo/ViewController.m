//
//  ViewController.m
//  AES加密_Demo
//
//  Created by Lix on 16/9/21.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "ViewController.h"
#import "NEUSecurityUtil.h"
#import "ZCHttpTool.h"


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
    NSString *str = @"phone=13362922277&name=中国&pid=358&t=1443168027&token=2asdfjdfa&name=浙江&address=杭州&room=322&baby=anglababy&commmdr=sasdfcccc&right=yes&test=11+-";
    NSString *encryptStr = [NEUSecurityUtil neu_encryptAESData:str];
    NSLog(@"加密后的字符串 = %@", encryptStr);
    
    
    NSString *decryptStr = [NEUSecurityUtil neu_decryptAESData:encryptStr];
    NSLog(@"解密后的字符串 = %@", decryptStr);
}

-(void)netWork:(NSString *)str
{
//    NSString *url = @"http://club.autohome.com.cn/bbs/thread-c-3693-63376668-1.html";
//    
//    _web = [[UIWebView alloc] init];
//    _web.frame = self.view.bounds;
//    [self.view addSubview:_web];
//    
//    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
//    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(progressViewAction) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop]addTimer:timer
//                             forMode:NSRunLoopCommonModes];
//    NSDictionary *dic = @{@"keySet":str};
    
//    [ZCHttpTool post:url params:nil success:^(id responsePbj) {
//        NSLog(@"返回的%@",responsePbj);
//    } failure:^(NSError *error) {
//        NSLog(@"返回的%@",error);
//    }];
}

-(void)progressViewAction
{
    [_web reload];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
