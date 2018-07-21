//
//  HttpManager.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HttpManager : NSObject

- (void)getHomeData:(NSDictionary*)userDict :(void (^)(id responseObject))success failure: (void (^)(NSError *error))failure;
- (void)getFlashData: (void (^)(id))success failure:(void (^)(NSError *))failure;
@end
