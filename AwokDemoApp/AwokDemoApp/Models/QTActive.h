//
//  QTActive.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QTActive : NSObject
    
@property (nonatomic, readonly, copy) NSString *value;
    
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTActive *)y;

@end
