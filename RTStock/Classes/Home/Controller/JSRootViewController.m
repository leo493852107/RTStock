//
//  JSRootViewController.m
//  RTStock
//
//  Created by leo on 6/5/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSRootViewController.h"
#import "JSStock.h"
#import "JSHTTPTool.h"
#import "JSBuyPankou.h"

#import <MJExtension.h>

@interface JSRootViewController ()

/** sellPankouTableView */
@property (nonatomic, strong) UITableView *sellTV;

/** buyPankouTableView */
@property (nonatomic, strong) UITableView *buyTV;

@end

@implementation JSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JSHTTPTool GET:@"https://app.leverfun.com/timelyInfo/timelyOrderForm?stockCode=" stockCode:@"300104" parameters:nil success:^(id responseObject) {
        
        JSStock *stock = [JSStock mj_objectWithKeyValues:responseObject];
        
        NSArray *buyPankous = stock.buyPankous;
        
        for (int i = 0; i < buyPankous.count; i++) {
            JSBuyPankou *buy = buyPankous[i];
            NSLog(@"%@", buy.price);
            NSLog(@"%ld", (long)buy.volume);
        }
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
