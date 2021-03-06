//
//  HomeCollectionViewCell.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "AwokPrices.h"
#import "AwokItem.h"
#import "AwokImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation HomeCollectionViewCell


-(void)awakeFromNib {
    [super awakeFromNib];
    
    

}


- (void)setDataForCell:(AwokItem *)item {
    self.titleItem.text = item.name;
    //self.oldPrice.text = [NSString stringWithFormat:@"%ld",(long)item.prices.priceOld];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld AED",(long)item.prices.priceOld]];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@1
                            range:NSMakeRange(0, [attributeString length])];
    self.oldPrice.attributedText = attributeString;
    self.currentPrice.text = [NSString stringWithFormat:@"%ld AED",(long)item.prices.priceNew];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.image.src]
                 placeholderImage:[UIImage imageNamed:@"image-placeholder.png"]];
    
    if([item.state isEqualToString:@"UPCOMING"]) {
        self.buyLabel.text = @"Upcoming Flash Sale";
        self.buyBackgroundView.backgroundColor = [UIColor greenColor];
//        if (_isFlash){
//            _isFlash = false;
//        }
    } else if([item.state isEqualToString:@"ACTIVE"]) {
        self.buyLabel.text = @"Add to Cart";
        self.buyBackgroundView.backgroundColor = [UIColor redColor];


    } else {
        self.buyLabel.text = @"Add to Cart";
        self.buyBackgroundView.backgroundColor = [UIColor redColor];

    }
    [self.saleTimer setHidden:true];
    
}

- (IBAction)btnBuyPressed:(id)sender {
    [self.delegate buyButtonSelected:self.tag];
}


@end
