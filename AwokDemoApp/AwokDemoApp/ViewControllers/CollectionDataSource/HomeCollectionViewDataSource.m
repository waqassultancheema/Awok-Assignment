//
//  HomeCollectionViewDataSource.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeCollectionViewDataSource.h"
#import <UIKit/UIKit.h>
#import "HomeCollectionViewCell.h"
#import "HomeFlashCollectionViewCell.h"
#import "Session.h"
#import "AwokDashboard.h"
#import "AwokData.h"
#import "AwokOutput.h"
@interface HomeCollectionViewDataSource ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end


@implementation HomeCollectionViewDataSource

-(instancetype) init {
    
    self = [super init];
    if (self) {
    }
    return self;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if(indexPath.row == 0 ) {
//        HomeFlashCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeFlashCollectionViewCel" forIndexPath:indexPath];
//        return cell;
//    } else {
        HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
        [cell setDataForCell:[[Session sharedInstance].awokhome.output.data.items objectAtIndex:indexPath.row]];
        return cell;
 //   }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [Session sharedInstance].awokhome.output.data.items.count;// + 1;

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(200, 200);
}
@end
