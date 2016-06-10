//
//  JSStock.m
//  RTStock
//
//  Created by leo on 6/6/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSStock.h"
#import <MJExtension.h>


@implementation JSStock

// !!! 转换特殊参数
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"buyPankous" : @"data.buyPankou",
             @"sellPankous" : @"data.sellPankou",
             @"match" : @"data.match",
             @"preClose" : @"data.preClose"
             };
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"buyPankous" : @"JSBuyPankou",
             @"sellPankous" : @"JSSellPankou"
             };
}


@end
