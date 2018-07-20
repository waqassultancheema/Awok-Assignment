//
//  HomeSerializer.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeSerializer.h"
#import "AwokDashboard.h"
#import "Session.h"

@implementation HomeSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error{
    
    NSDictionary *responseDic = [super responseObjectForResponse:response data:data error:error];
    AwokDashboard *dashboard = [AwokDashboard fromJSONDictionary:responseDic];
    [[Session sharedInstance] setAwokhome:dashboard];
    return responseDic;
}



@end
