//
//  JSRootViewCell.h
//  RTStock
//
//  Created by leo on 6/8/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSBuyPankou,JSSellPankou;
@interface JSRootViewCell : UITableViewCell

/** 买家还是卖家 */
@property (nonatomic, copy) NSString *buySellPerson;

/** 卖盘 */
@property (nonatomic, strong) JSSellPankou *sellPankou;

/** 买盘 */
@property (nonatomic, strong) JSBuyPankou *buyPankou;

@end
