//
//  HomeCollectionViewCell.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <UIKit/UIKit.h>




@class AwokItem;

@protocol HomeCollectionViewCellDelegate


- (void)buyButtonSelected:(NSInteger)index;

@end

@interface HomeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleItem;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *currentPrice;
@property (weak, nonatomic) IBOutlet UIView *buyBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleTimer;


@property (weak, nonatomic) id <HomeCollectionViewCellDelegate> delegate;

- (void)setDataForCell:(AwokItem *)item;
@end
