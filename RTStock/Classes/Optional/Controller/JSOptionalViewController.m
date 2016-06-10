//
//  JSOptionalViewController.m
//  RTStock
//
//  Created by leo on 6/10/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSOptionalViewController.h"

@interface JSOptionalViewController ()

@end

@implementation JSOptionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    
    
}

- (void)initNav {
    
    self.navigationController.navigationBar.barTintColor = JSGlobalRedColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    self.title = @"自选";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
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
