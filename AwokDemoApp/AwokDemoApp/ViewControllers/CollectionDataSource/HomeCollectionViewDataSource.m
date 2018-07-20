//
//  HomeCollectionViewDataSource.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeCollectionViewDataSource.h"
#import <UIKit/UIKit.h>
@interface HomeCollectionViewDataSource ()<UICollectionViewDelegate,UICollectionViewDataSource>


@end


@implementation HomeCollectionViewDataSource

-(instancetype) init {
    
    self = [super init];
    if (self) {
    }
    return self;
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
    
    return cell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

@end
