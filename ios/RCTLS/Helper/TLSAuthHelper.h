//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "Constant.h"
#import "TLSSDK/TLSHelper.h"
#import "QALSDK/QalSDKProxy.h"
#import "StrAccountRegCb.h"
#import "PwdLoginCb.h"
@interface TLSAuthHelper : NSObject
+(void)initTLS;
+(void)register:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)login:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)verifyImgCode:(NSString *)code resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)reaskImgCode:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
@end