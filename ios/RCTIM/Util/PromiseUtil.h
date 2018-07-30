//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface PromiseUtil : NSObject
+(NSDictionary *)createResolve:(NSInteger)code msg:(NSString *)msg;
+(NSDictionary *)createSuccResolve:(NSString *)msg;
+(void)rejectWithMsg:(RCTPromiseRejectBlock)reject msg:(NSString *)msg;
@end