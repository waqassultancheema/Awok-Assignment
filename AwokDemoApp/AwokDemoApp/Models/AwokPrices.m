//
//  AwokPrices.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokPrices.h"
#import "AwokEndTime.h"
@implementation AwokPrices
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"PRICE_NEW": @"priceNew",
                                                        @"PRICE_OLD": @"priceOld",
                                                        @"DISCOUNT": @"discount",
                                                        @"PERCENT": @"percent",
                                                        @"TIMER": @"timer",
                                                        @"END_TIME": @"endTime",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokPrices alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
            _timer = [AwokEndTime fromJSONDictionary:(id)_timer];
            _endTime = [AwokEndTime fromJSONDictionary:(id)_endTime];
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokPrices.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokPrices.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokPrices.properties) {
            id propertyName = AwokPrices.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        // Map values that need translation
        [dict addEntriesFromDictionary:@{
                                         @"TIMER": [_timer JSONDictionary],
                                         @"END_TIME": [_endTime JSONDictionary],
                                         }];
        
        return dict;
    }
    @end
