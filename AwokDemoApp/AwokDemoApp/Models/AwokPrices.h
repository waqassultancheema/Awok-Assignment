//
//  AwokPrices.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AwokEndTime;
@interface AwokPrices : NSObject
    
    @property (nonatomic, assign) NSInteger priceNew;
    @property (nonatomic, assign) NSInteger priceOld;
    @property (nonatomic, assign) NSInteger discount;
    @property (nonatomic, assign) NSInteger percent;
    @property (nonatomic, strong) AwokEndTime *timer;
    @property (nonatomic, strong) AwokEndTime *endTime;
    
@end

@interface AwokPrices (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
    @end
