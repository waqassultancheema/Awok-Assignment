//
//  HttpManager.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HttpManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager.h"
#import "AwokDashboard.h"
#import "HomeSerializer.h"
#import "HTTPHeaderDecorator.h"
@implementation HttpManager {
    
}

-(instancetype) init {
    
    self = [super init];
    if (self) {
    }
    return self;
    
}

- (void)getHomeData:(NSString *)pageNo :(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *operation = [AFHTTPSessionManager manager];
    HTTPHeaderDecorator *decorator = [HTTPHeaderDecorator serializer];
    operation.requestSerializer = decorator;
    [operation setResponseSerializer:[HomeSerializer serializer]];
  
    NSString * urlStr= [NSString stringWithFormat:@"http://www.awok.com/api/home/"];
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: @(2), @"PAGED", nil];
    
    [operation POST:urlStr parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        success(responseObject);
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        failure(error);
        NSLog(@"Error: %@", error);
    }];
}
@end
