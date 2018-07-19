//
//  AwokNavigation.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokNavigation.h"

@implementation AwokNavigation
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"TOTAL": @"total",
                                                        @"COUNT": @"count",
                                                        @"PAGE": @"page",
                                                        @"MAX_PAGES": @"maxPages",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokNavigation alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokNavigation.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokNavigation.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokNavigation.properties) {
            id propertyName = AwokNavigation.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        return dict;
    }
@end
