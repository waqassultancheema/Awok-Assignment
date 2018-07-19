//
//  AwokDashboard.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokDashboard.h"
#import "AwokOutput.h"



#pragma mark - JSON serialization

AwokDashboard *_Nullable AwokDashboardFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [AwokDashboard fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

AwokDashboard *_Nullable AwokDashboardFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return AwokDashboardFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable AwokDashboardToData(AwokDashboard *dashboard, NSError **error)
{
    @try {
        id json = [dashboard JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable AwokDashboardToJSON(AwokDashboard *dashboard, NSStringEncoding encoding, NSError **error)
{
    NSData *data = AwokDashboardToData(dashboard, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation AwokDashboard
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"OUTPUT": @"output",
                                                        };
    }
    
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
    {
        return AwokDashboardFromData(data, error);
    }
    
+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
    {
        return AwokDashboardFromJSON(json, encoding, error);
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokDashboard alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
            _output = [AwokOutput fromJSONDictionary:(id)_output];
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokDashboard.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokDashboard.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokDashboard.properties) {
            id propertyName = AwokDashboard.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        // Map values that need translation
        [dict addEntriesFromDictionary:@{
                                         @"OUTPUT": [_output JSONDictionary],
                                         }];
        
        return dict;
    }
    
- (NSData *_Nullable)toData:(NSError *_Nullable *)error
    {
        return AwokDashboardToData(self, error);
    }
    
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
    {
        return AwokDashboardToJSON(self, encoding, error);
    }
    @end
