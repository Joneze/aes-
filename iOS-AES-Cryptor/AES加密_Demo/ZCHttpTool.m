//
//  ZCHttpTool.m
//  LeafSlideMenu
//
//  Created by 曾辉 on 15/8/24.
//  Copyright (c) 2015年 Wang. All rights reserved.
//

#import "ZCHttpTool.h"
#import "AFNetworking.h"


@implementation ZCHttpTool

+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure
{
    // 获得请求管理
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 30.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    // 发送get请求
    [session GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure
{
    //获得请求管理
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 30.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //发送post请求
    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        //请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
            
                        success(responseObject);
        
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


+ (void)uploadImageWithUrl:(NSString *)url params:(NSDictionary *)params image:(UIImage *)image
                   success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 30.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [session POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
  
    
    
}

//+(void)getQiniuTokenFromSever:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
//{
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
////    NSDictionary *params = @{@"access_token":[SJUserInfo Token]};
////    
////    NSString *url = [NSString stringWithFormat:@"%@upload/token",ZCBaseUrl];
//    
//    
//    // 发送get请求
//    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    
//        
//        if (success) {
//            success(responseObject);
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//    
//}

@end
