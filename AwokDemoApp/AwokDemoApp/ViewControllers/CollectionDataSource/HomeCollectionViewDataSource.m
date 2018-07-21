//
//  HomeCollectionViewDataSource.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeCollectionViewDataSource.h"
#import "HomeCollectionViewCell.h"
#import "HomeFlashCollectionViewCell.h"
#import "Session.h"
#import "AwokDashboard.h"
#import "AwokData.h"
#import "AwokOutput.h"
@interface HomeCollectionViewDataSource ()<HomeCollectionViewCellDelegate,HomeFlashCollectionViewCellDelegate> {
    NSInteger pageNo;
}


@end


@implementation HomeCollectionViewDataSource

-(instancetype) init {
    
    self = [super init];
    if (self) {
        pageNo = 1;
        _waiting = false;
    }
    return self;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 ) {
        HomeFlashCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeFlashCollectionViewCel" forIndexPath:indexPath];
        cell.delegate = self;
        [cell.collectionView reloadData];
        return cell;
    } else {
        HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
        [cell setDataForCell:[[Session sharedInstance].awokItems objectAtIndex:indexPath.row]];
        cell.tag = indexPath.row;
        cell.delegate = self;
        return cell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    }
    return [Session sharedInstance].awokItems.count;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width, 50);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return CGSizeMake(collectionView.frame.size.width, 300);

    }
    return CGSizeMake(200, 300);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        }
        NSString *ste = @"";
        if (indexPath.section == 1) {
            if(Session.sharedInstance.awokhome != nil) {
                ste  =  Session.sharedInstance.awokhome.output.data.title;
            }
        } else {
            if(Session.sharedInstance.awokFlash != nil) {
                ste  =  Session.sharedInstance.awokFlash.output.data.title;
            }

        }
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        label.text=[NSString stringWithFormat:@"  %@",ste];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        [reusableview addSubview:label];
        return reusableview;
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == Session.sharedInstance.awokItems.count-1 && !_waiting)  {
        _waiting = true;
        pageNo = pageNo + 1;
        [self.delegate loadMoreDataFromServer:pageNo];
    }
}
- (void)buyButtonSelected:(NSInteger)index {
    [self.delegate buyButtonSelected:index];
}

@end
