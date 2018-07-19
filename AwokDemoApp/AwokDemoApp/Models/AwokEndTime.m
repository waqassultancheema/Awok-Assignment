//
//  AwokEndTime.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokEndTime.h"

@implementation AwokEndTime
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokEndTime alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
        }
        return self;
    }
    
- (NSDictionary *)JSONDictionary
    {
        return [self dictionaryWithValuesForKeys:AwokEndTime.properties.allValues];
    }
@end
