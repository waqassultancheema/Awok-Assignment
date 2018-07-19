//
//  AwokImage.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokImage.h"

@implementation AwokImage
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"ID": @"imageID",
                                                        @"SRC": @"src",
                                                        @"WIDTH": @"width",
                                                        @"HEIGHT": @"height",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokImage alloc] initWithJSONDictionary:dict] : nil;
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
        id resolved = AwokImage.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokImage.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokImage.properties) {
            id propertyName = AwokImage.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        return dict;
    }
@end
