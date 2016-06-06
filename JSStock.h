//
//  JSStock.h
//  RTStock
//
//  Created by leo on 6/6/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSStock : NSObject

/** code */
@property (nonatomic, assign) NSInteger code;

/** buyPankou */
@property (nonatomic, strong) NSArray *buyPankous;

/** sellPankou */
@property (nonatomic, strong) NSArray *sellPankous;

/** match */
@property (nonatomic, strong) NSString *match;

/** preClose */
@property (nonatomic, copy) NSString *preClose;

/** success */
@property (nonatomic, assign) BOOL success;



@end

