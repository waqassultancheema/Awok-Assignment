//
//  AwokOutput.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokOutput.h"
#import "AwokData.h"
#import "AwokNavigation.h"
@implementation AwokOutput
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"DATA": @"data",
                                                        @"NAVIGATION": @"navigation",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokOutput alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
            _data = [AwokData fromJSONDictionary:(id)_data];
            _navigation = [AwokNavigation fromJSONDictionary:(id)_navigation];
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokOutput.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokOutput.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokOutput.properties) {
            id propertyName = AwokOutput.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        // Map values that need translation
        [dict addEntriesFromDictionary:@{
                                         @"DATA": [_data JSONDictionary],
                                         @"NAVIGATION": [_navigation JSONDictionary],
                                         }];
        
        return dict;
    }
    @end
