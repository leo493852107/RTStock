//
//  JSRootViewCell.m
//  RTStock
//
//  Created by leo on 6/8/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSRootViewCell.h"
#import "JSSellPankou.h"
#import "JSBuyPankou.h"
#import "JSStock.h"

@interface JSRootViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *buySellLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;


@end

@implementation JSRootViewCell



- (void)setBuySellPerson:(NSString *)buySellPerson {
    self.buySellLabel.text = buySellPerson;
}

- (void)setBuyPankou:(JSBuyPankou *)buyPankou {
    self.volumeLabel.text = [NSString stringWithFormat:@"%ld", (long)buyPankou.volume];
    float preClose = roundf(self.stock.preClose*100)/100;
    float price = roundf(buyPankou.price*100)/100;
    if (price > preClose) {
        // 比收盘价高
        self.priceLabel.textColor = [UIColor redColor];
    } else if (price < preClose) {
        // 比收盘价低
        self.priceLabel.textColor = [UIColor greenColor];
    } else {
        self.priceLabel.textColor = [UIColor blackColor];
    }
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", price];
}

- (void)setSellPankou:(JSSellPankou *)sellPankou {
    self.volumeLabel.text = [NSString stringWithFormat:@"%ld", (long)sellPankou.volume];
    float preClose = roundf(self.stock.preClose*100)/100;
    float price = roundf(sellPankou.price*100)/100;
    if (price > preClose) {
        // 比收盘价高
        self.priceLabel.textColor = [UIColor redColor];
    } else if (price < preClose) {
        // 比收盘价低
        self.priceLabel.textColor = [UIColor greenColor];
    } else {
        self.priceLabel.textColor = [UIColor blackColor];
    }
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", price];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
