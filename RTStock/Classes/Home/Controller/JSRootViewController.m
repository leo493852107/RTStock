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
#import "JSRootViewCell.h"


#import <MJExtension.h>

@interface JSRootViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *sellPanTableView;
@property (weak, nonatomic) IBOutlet UITableView *buyPanTableView;


@property (weak, nonatomic) IBOutlet UILabel *stockName;

/** 卖盘模型数组 */
@property (nonatomic, strong) NSArray *sellPankousArr;

/** 买盘模型数组 */
@property (nonatomic, strong) NSArray *buyPankousArr;

@end

static NSString * const JSTagId = @"tag";

@implementation JSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
}

// 加载数据
- (void)loadData {
    [JSHTTPTool GET:@"https://app.leverfun.com/timelyInfo/timelyOrderForm?stockCode=" stockCode:@"300104" parameters:nil success:^(id responseObject) {
        
        JSStock *stock = [JSStock mj_objectWithKeyValues:responseObject];
        self.buyPankousArr = stock.buyPankous;
        self.sellPankousArr = stock.sellPankous;
        
        
        [self.sellPanTableView reloadData];
        [self.buyPanTableView reloadData];
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

// 界面初始化
- (void)initUI {
    
    [self.sellPanTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JSRootViewCell class]) bundle:nil] forCellReuseIdentifier:JSTagId];
    
    [self.buyPanTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JSRootViewCell class]) bundle:nil] forCellReuseIdentifier:JSTagId];
    
    self.stockName.text = @"乐视网 300104";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSRootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JSTagId];
    if (cell == nil) {
        cell = [[JSRootViewCell alloc] init];
    }
    
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
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
