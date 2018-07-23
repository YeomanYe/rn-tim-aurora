//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImSDK/TIMManager.h>
#import <React/RCTBridgeModule.h>

@interface AuthHelper : NSObject
+(void)login:(NSString *)identifier userSig:(NSString *)user resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
@end