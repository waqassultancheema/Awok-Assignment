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
#import "FlashSerializer.h"
@implementation HttpManager {
    
}

-(instancetype) init {
    
    self = [super init];
    if (self) {
    }
    return self;
    
}

- (void)getHomeDataWithPageNo:(NSString *)pageNo :(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *operation = [AFHTTPSessionManager manager];
    HTTPHeaderDecorator *decorator = [HTTPHeaderDecorator serializer];
    operation.requestSerializer = decorator;
    [operation setResponseSerializer:[HomeSerializer serializer]];
  
   // NSString * urlStr= [NSString stringWithFormat:@"http://www.awok.com/api/home/"];
    //https://ae.awok.com/sources/updates/api/rpromo/page/1/
    NSString * urlStr= [NSString stringWithFormat:@"https://ae.awok.com/sources/updates/api/rpromo/page/%@/",pageNo];

    //NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: @(2), @"PAGED", nil];
    
    [operation GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"Error: %@", error);
    }];
//    [operation POST:urlStr parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        success(responseObject);
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        failure(error);
//        NSLog(@"Error: %@", error);
//    }];
}

- (void)getFlashData: (void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *operation = [AFHTTPSessionManager manager];
    HTTPHeaderDecorator *decorator = [HTTPHeaderDecorator serializer];
    operation.requestSerializer = decorator;
    [operation setResponseSerializer:[FlashSerializer serializer]];
    
    NSString * urlStr= [NSString stringWithFormat:@"http://www.awok.com/api/flash/"];
    [operation GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"Error: %@", error);
    }];
}
@end
