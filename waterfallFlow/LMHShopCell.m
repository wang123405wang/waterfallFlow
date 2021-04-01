//
//  LMHShopCell.m
//  WateFallLayoutTest
//
//  Created by 刘梦桦 on 2017/5/19.
//  Copyright © 2017年 lmh. All rights reserved.
//

#import "LMHShopCell.h"

@interface LMHShopCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation LMHShopCell

/**
 * 重写商品的setter方法
 */
- (void)setShop:(NSString *)shop{
    
    _shop = shop;
    
    // 图片
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    self.imageView.backgroundColor = UIColor.redColor;
    self.contentView.backgroundColor = UIColor.yellowColor;
    // 价格
}
@end
