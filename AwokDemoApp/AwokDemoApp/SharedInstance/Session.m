//
//  Session.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "Session.h"

@implementation Session



+ (Session*)sharedInstance{
    static Session *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Session alloc] init];
    });
    return sharedInstance;
}
@end
