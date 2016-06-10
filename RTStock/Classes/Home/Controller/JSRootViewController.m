//
//  JSRootViewController.m
//  RTStock
//
//  Created by leo on 6/5/16.
//  Copyright © 2016 leo. All rights reserved.
//  主页

#import "JSRootViewController.h"
#import "JSStock.h"
#import "JSHTTPTool.h"
#import "JSBuyPankou.h"
#import "JSRootViewCell.h"

#import <MJExtension.h>

@interface JSRootViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *sellPanTableView;
@property (weak, nonatomic) IBOutlet UITableView *buyPanTableView;
@property (weak, nonatomic) IBOutlet UILabel *stockName;

/** Stock */
@property (nonatomic, strong) JSStock *stock;

/** 卖盘模型数组 */
@property (nonatomic, strong) NSArray *sellPankousArr;

/** 买盘模型数组 */
@property (nonatomic, strong) NSArray *buyPankousArr;

@end

static NSString * const JSTagId = @"tag";

@implementation JSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 界面初始化
    [self initNav];
    
    [self loadData];
    
}

// 界面初始化
- (void)initNav {
    
    self.navigationController.navigationBar.barTintColor = JSGlobalRedColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    self.title = @"主页";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    // TableViews
    [self.sellPanTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JSRootViewCell class]) bundle:nil] forCellReuseIdentifier:JSTagId];
    self.sellPanTableView.tableFooterView = [[UIView alloc] init];
    self.sellPanTableView.scrollEnabled = NO;
    
    [self.buyPanTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JSRootViewCell class]) bundle:nil] forCellReuseIdentifier:JSTagId];
    self.buyPanTableView.tableFooterView = [[UIView alloc] init];
    self.buyPanTableView.scrollEnabled = NO;
    
    self.stockName.text = @"乐视网 300104";
}

// 加载数据
- (void)loadData {
    [JSHTTPTool GET:@"https://app.leverfun.com/timelyInfo/timelyOrderForm?stockCode=" stockCode:@"300104" parameters:nil success:^(id responseObject) {
        
        JSStock *stock = [JSStock mj_objectWithKeyValues:responseObject];
        self.buyPankousArr = stock.buyPankous;
        self.sellPankousArr = stock.sellPankous;
        self.stock = stock;
        
        [self.sellPanTableView reloadData];
        [self.buyPanTableView reloadData];
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSRootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JSTagId];
    if (cell == nil) {
        cell = [[JSRootViewCell alloc] init];
    }
    
    cell.stock = self.stock;
    
    NSInteger index = indexPath.row + 1;
    // 卖家 tableView
    if (tableView == self.sellPanTableView) {
        cell.sellPankou = self.sellPankousArr[indexPath.row];
        cell.buySellPerson = [NSString stringWithFormat:@"卖家%ld",(long)index];
    }
    // 买家 tableView
    if (tableView == self.buyPanTableView) {
        cell.buyPankou = self.buyPankousArr[indexPath.row];
        cell.buySellPerson = [NSString stringWithFormat:@"买家%ld",(long)index];
    }
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.sellPanTableView) {
        return self.sellPankousArr.count;
    }
    // 买家 tableView
    if (tableView == self.buyPanTableView) {
        return self.buyPankousArr.count;
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
