//
//  HomeCollectionViewCell.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeFlashCollectionViewCell.h"
#import "HomeCollectionViewCell.h"

#import "Session.h"
#import "AwokDashboard.h"
#import "AwokData.h"
#import "AwokOutput.h"

@interface HomeFlashCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,HomeCollectionViewCellDelegate>


@end

@implementation HomeFlashCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
        [cell setDataForCell:[[Session sharedInstance].awokFlash.output.data.items objectAtIndex:indexPath.row]];
        cell.tag = indexPath.row;
    cell.delegate = self;
        return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [Session sharedInstance].awokFlash.output.data.items.count;
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(190, 300);
}


- (void)buyButtonSelected:(NSInteger)index {
    [self.delegate buyButtonSelected:index];
}

@end
