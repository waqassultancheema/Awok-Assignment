//
//  HomeCollectionViewDataSource.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol HomeCollectionViewDataSourceDelegate


- (void)buyButtonSelected:(NSInteger)index;
- (void)loadMoreDataFromServer:(NSInteger)pageNo;

@end
@interface HomeCollectionViewDataSource : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) id <HomeCollectionViewDataSourceDelegate> delegate;
@property (nonatomic) BOOL waiting;
;



@end
