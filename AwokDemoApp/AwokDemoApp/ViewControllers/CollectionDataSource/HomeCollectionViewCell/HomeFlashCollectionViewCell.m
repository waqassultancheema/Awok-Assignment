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

@interface HomeFlashCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>


@end

@implementation HomeFlashCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
        HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
        [cell setDataForCell:[[Session sharedInstance].awokhome.output.data.items objectAtIndex:indexPath.row]];
        return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [Session sharedInstance].awokhome.output.data.items.count;
}


@end
