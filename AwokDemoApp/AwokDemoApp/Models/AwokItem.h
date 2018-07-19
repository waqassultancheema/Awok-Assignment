//
//  AwokItem.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AwokColor,AwokImage,AwokPrices;
@interface AwokItem : NSObject
    @property (nonatomic, copy)           NSString *itemID;
    @property (nonatomic, copy)           NSString *linkedProdID;
    @property (nonatomic, copy)           NSString *name;
    @property (nonatomic, copy)           NSString *sort;
    @property (nonatomic, copy)           NSString *activeTo;
    @property (nonatomic, copy)           NSString *activeFrom;
    @property (nonatomic, copy)           NSString *detailLink;
    @property (nonatomic, nullable, copy) id maxQuantity;
    @property (nonatomic, strong)         AwokImage *image;
    @property (nonatomic, strong)         AwokPrices *prices;
    @property (nonatomic, copy)           NSString *state;
    @property (nonatomic, copy)           NSString *enableTimer;
    @property (nonatomic, nullable, copy) id soldOut;
    @property (nonatomic, copy)           NSString *showDiscount;
    @property (nonatomic, nullable, copy) id showNextTimer;
    @property (nonatomic, assign)         BOOL isAnalytics;
    @property (nonatomic, assign)         BOOL isStockData;
 //   @property (nonatomic, strong)         AwokCartData *cartData;
    @property (nonatomic, copy)           NSString *typeProduct;
    @property (nonatomic, copy)           NSString *stock;
    @property (nonatomic, copy)           NSString *expired;
    @property (nonatomic, copy)           NSString *active;
    @property (nonatomic, copy)           NSString *categoryID;
    @property (nonatomic, strong)         AwokColor *color;
@end

@interface AwokItem (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
    @end
