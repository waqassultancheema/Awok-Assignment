//
//  Session.h
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AwokDashboard.h"
@interface Session : NSObject


@property (nonatomic, strong) AwokDashboard *awokhome;


+ (Session*)sharedInstance;

@end
