//
//  AwokNavigation.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwokNavigation : NSObject
    
    @property (nonatomic, assign) NSInteger total;
    @property (nonatomic, assign) NSInteger count;
    @property (nonatomic, assign) NSInteger page;
    @property (nonatomic, assign) NSInteger maxPages;
@end

@interface AwokNavigation (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
    @end
