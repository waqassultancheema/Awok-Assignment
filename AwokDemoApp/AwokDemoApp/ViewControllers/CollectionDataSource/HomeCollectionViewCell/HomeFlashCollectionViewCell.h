//
//  HomeCollectionViewCell.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HomeFlashCollectionViewCellDelegate


- (void)buyButtonSelected:(NSInteger)index;

@end

@class AwokItem;
@interface HomeFlashCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) id <HomeFlashCollectionViewCellDelegate> delegate;

@end
