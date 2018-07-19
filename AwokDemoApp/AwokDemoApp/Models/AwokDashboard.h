//
//  AwokDashboard.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AwokOutput,AwokDashboard;

@interface AwokDashboard : NSObject
    @property (nonatomic, strong) AwokOutput *output;
    
+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
    
@end
@interface AwokDashboard (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end
