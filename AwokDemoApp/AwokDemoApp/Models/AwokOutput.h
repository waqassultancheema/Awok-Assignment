//
//  AwokOutput.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AwokData,AwokNavigation;
@interface AwokOutput : NSObject
    @property (nonatomic, strong) AwokData *data;
    @property (nonatomic, strong) AwokNavigation *navigation;
@end

@interface AwokOutput (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
