//
//  HTTPHeaderDecorator.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HTTPHeaderDecorator.h"

@implementation HTTPHeaderDecorator

- (instancetype)initWithSerializor:(AFJSONRequestSerializer *)serializor{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _decoratedSerializor = serializor;
    
    return self;
}

+ (instancetype)serializer{
    return [[self alloc] initWithSerializor:[[AFJSONRequestSerializer alloc] init]];
}

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError * __autoreleasing *)error{
    
    [self.decoratedSerializor setValue:@"en" forHTTPHeaderField:@"apilang"];
    [self.decoratedSerializor setValue:@"1832" forHTTPHeaderField:@"App-Version"];

    return [self.decoratedSerializor requestBySerializingRequest:request withParameters:parameters error:error];
}



@end
