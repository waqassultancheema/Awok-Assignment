//
//  AwokImage.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwokImage : NSObject
    
    @property (nonatomic, copy)   NSString *imageID;
    @property (nonatomic, copy)   NSString *src;
    @property (nonatomic, assign) NSInteger width;
    @property (nonatomic, assign) NSInteger height;
    
@end
@interface AwokImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
    @end
