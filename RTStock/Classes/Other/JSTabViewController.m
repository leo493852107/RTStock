//
//  JSTabViewController.m
//  RTStock
//
//  Created by leo on 6/10/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSTabViewController.h"
#import "JSRootViewController.h"
#import "JSOptionalViewController.h"

@interface JSTabViewController ()

/** 强引用 */
@property (nonatomic, strong) NSArray *vcArray;

@end

@implementation JSTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewController];
}

#pragma mark - 加载控制器
- (void)initViewController {
    
    // 主页
    JSRootViewController *rootVC = [[JSRootViewController alloc] init];
    rootVC.tabBarItem.title = @"主页";
    [rootVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    rootVC.tabBarItem.image = [UIImage imageNamed:@"home"];
    rootVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootNav.navigationBarHidden = YES;
    
    // 自选
    JSOptionalViewController *optionalVC = [[JSOptionalViewController alloc] init];
    optionalVC.tabBarItem.title = @"自选";
    [optionalVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    optionalVC.tabBarItem.image = [UIImage imageNamed:@"optional"];
    optionalVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"optional"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *optionalNav = [[UINavigationController alloc] initWithRootViewController:optionalVC];
    optionalNav.navigationBarHidden = YES;
    
    NSArray *vcArray = @[rootVC,optionalVC];
    self.vcArray = vcArray;
    NSMutableArray *tabArray = [NSMutableArray arrayWithCapacity:self.vcArray.count];
    for (int i = 0; i < self.vcArray.count; i++) {
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.vcArray[i]];
        [tabArray addObject:navController];
    }
    self.viewControllers = tabArray;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
