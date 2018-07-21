//
//  HomeSerializer.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeSerializer.h"
#import "AwokDashboard.h"
#import "Session.h"
#import "AwokOutput.h"
#import "AwokData.h"
@implementation HomeSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error{
    
    NSDictionary *responseDic = [super responseObjectForResponse:response data:data error:error];
    AwokDashboard *dashboard = [AwokDashboard fromJSONDictionary:responseDic];
    [[Session sharedInstance] setAwokhome:dashboard];
    
    if ([[Session sharedInstance] awokItems] == nil) {
        [Session sharedInstance].awokItems = [[NSMutableArray alloc] initWithArray:dashboard.output.data.items];
    } else {
        [[[Session sharedInstance] awokItems] addObjectsFromArray:dashboard.output.data.items];

    }
    return responseDic;
}



@end
