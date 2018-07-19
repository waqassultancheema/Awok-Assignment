//
//  AwokData.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AwokItem;
@interface AwokData : NSObject
    
    @property (nonatomic, copy)   NSArray<AwokItem *> *items;
    @property (nonatomic, copy)   NSString *heading;
    @property (nonatomic, copy)   NSString *title;
    @property (nonatomic, assign) BOOL isIsFlash;
@end


@interface AwokData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
