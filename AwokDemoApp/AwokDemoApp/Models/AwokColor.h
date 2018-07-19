//
//  AwokColor.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwokColor : NSObject
    @property (nonatomic, copy) NSString *bColor;
    @property (nonatomic, copy) NSString *bdrColor;
@end

@interface AwokColor (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
