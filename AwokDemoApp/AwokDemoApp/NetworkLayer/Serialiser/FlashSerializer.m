//
//  HomeSerializer.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "FlashSerializer.h"
#import "AwokDashboard.h"
#import "Session.h"

@implementation FlashSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error{
    
    NSDictionary *responseDic = [super responseObjectForResponse:response data:data error:error];
    AwokDashboard *dashboard = [AwokDashboard fromJSONDictionary:responseDic];
    [[Session sharedInstance] setAwokFlash:dashboard];
    return responseDic;
}



@end
