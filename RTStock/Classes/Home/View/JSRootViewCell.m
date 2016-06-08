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
    self.priceLabel.text = buyPankou.price;
    self.volumeLabel.text = [NSString stringWithFormat:@"%ld", buyPankou.volume];
}

- (void)setSellPankou:(JSSellPankou *)sellPankou {
    self.priceLabel.text = sellPankou.price;
    self.volumeLabel.text = [NSString stringWithFormat:@"%ld", sellPankou.volume];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
