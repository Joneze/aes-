//
//  ZCHttpTool.h
//  LeafSlideMenu
//
//  Created by 曾辉 on 15/8/24.
//  Copyright (c) 2015年 Wang. All rights reserved.
// 自己写一个网络请求的工具类，面向这个类，所有控制器都使用这个类完成网络请求的发送，而这个工具类内部是使用哪个第三方框架来完成发送网络请求这个功能的，由这个工具类自己决定，降低对第三方框架的强依赖，如果换第三方网络库，直接在这边修改就可以了

#import <Foundation/Foundation.h>

@interface ZCHttpTool : NSObject

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure;


/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure;


/**
 *  上传图片
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param image   请求图片
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
// */
//+ (void)uploadImageWithUrl:(NSString *)url params:(NSDictionary *)params image:(UIImage *)image
//                   success:(void(^)(id responsePbj))success failure:(void(^)(NSError *error))failure;

/**
 *  获取七牛上传头像token方法
 *
 *  @param success 请求成功后回调
 *  @param failure 请求失败后回调
 */
//+(void)getQiniuTokenFromSever:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;



@end
