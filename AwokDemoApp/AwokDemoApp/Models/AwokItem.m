//
//  AwokItem.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "AwokItem.h"
#import "AwokImage.h"
#import "AwokColor.h"
#import "AwokPrices.h"
@implementation AwokItem
+ (NSDictionary<NSString *, NSString *> *)properties
    {
        static NSDictionary<NSString *, NSString *> *properties;
        return properties = properties ? properties : @{
                                                        @"ID": @"itemID",
                                                        @"LINKED_PROD_ID": @"linkedProdID",
                                                        @"NAME": @"name",
                                                        @"SORT": @"sort",
                                                        @"ACTIVE_TO": @"activeTo",
                                                        @"ACTIVE_FROM": @"activeFrom",
                                                        @"DETAIL_LINK": @"detailLink",
                                                        @"MAX_QUANTITY": @"maxQuantity",
                                                        @"IMAGE": @"image",
                                                        @"PRICES": @"prices",
                                                        @"STATE": @"state",
                                                        @"ENABLE_TIMER": @"enableTimer",
                                                        @"SOLD_OUT": @"soldOut",
                                                        @"SHOW_DISCOUNT": @"showDiscount",
                                                        @"SHOW_NEXT_TIMER": @"showNextTimer",
                                                        @"ANALYTICS": @"isAnalytics",
                                                        @"STOCK_DATA": @"isStockData",
                                                     //   @"CART_DATA": @"cartData",
                                                        @"TYPE_PRODUCT": @"typeProduct",
                                                        @"STOCK": @"stock",
                                                        @"EXPIRED": @"expired",
                                                        @"ACTIVE": @"active",
                                                        @"CATEGORY_ID": @"categoryID",
                                                        @"COLOR": @"color",
                                                        };
    }
    
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
    {
        return dict ? [[AwokItem alloc] initWithJSONDictionary:dict] : nil;
    }
    
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
    {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dict];
            _image = [AwokImage fromJSONDictionary:(id)_image];
            _prices = [AwokPrices fromJSONDictionary:(id)_prices];
          //  _cartData = [AwokCartData fromJSONDictionary:(id)_cartData];
            _color = [AwokColor fromJSONDictionary:(id)_color];
        }
        return self;
    }
    
- (void)setValue:(nullable id)value forKey:(NSString *)key
    {
        id resolved = AwokItem.properties[key];
        if (resolved) [super setValue:value forKey:resolved];
    }
    
- (NSDictionary *)JSONDictionary
    {
        id dict = [[self dictionaryWithValuesForKeys:AwokItem.properties.allValues] mutableCopy];
        
        // Rewrite property names that differ in JSON
        for (id jsonName in AwokItem.properties) {
            id propertyName = AwokItem.properties[jsonName];
            if (![jsonName isEqualToString:propertyName]) {
                dict[jsonName] = dict[propertyName];
                [dict removeObjectForKey:propertyName];
            }
        }
        
        // Map values that need translation
        [dict addEntriesFromDictionary:@{
                                         @"IMAGE": [_image JSONDictionary],
                                         @"PRICES": [_prices JSONDictionary],
                                         @"ANALYTICS": _isAnalytics ? @YES : @NO,
                                         @"STOCK_DATA": _isStockData ? @YES : @NO,
                                   //      @"CART_DATA": [_cartData JSONDictionary],
                                         @"COLOR": [_color JSONDictionary],
                                         }];
        
        return dict;
    }
    @end
