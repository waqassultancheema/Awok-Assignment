//
//  AwokData.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokData.h"
#import "AwokItem.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}
@implementation AwokData
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"ITEMS": @"items",
                                                        @"HEADING": @"heading",
                                                        @"TITLE": @"title",
                                                        @"IS_FLASH": @"isIsFlash",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokData alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
            _items = map(_items, λ(id x, [AwokItem fromJSONDictionary:x]));
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokData.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokData.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokData.properties) {
            id propertyName = AwokData.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        // Map values that need translation
        [dict addEntriesFromDictionary:@{
                                         @"ITEMS": map(_items, λ(id x, [x JSONDictionary])),
                                         @"IS_FLASH": _isIsFlash ? @YES : @NO,
                                         }];
        
        return dict;
    }
@end
