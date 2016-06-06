//
//  JSHTTPTool.h
//  RTStock
//
//  Created by leo on 6/6/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSHTTPTool : NSObject


/**
 *  GET请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *error))failure;

/**
 *  GET请求 + stockCode
 *
 *  @param URLString  请求的基本的url
 *  @param stockCode  股票代码
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString
  stockCode:(NSString *)stockCode
 parameters:(id)parameters
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *error))failure;


/**
 *  POST请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString
   parameter:(id)parameters
     success:(void(^)(id responseObject))success
     failure:(void(^)(NSError *error))failure;

@end
