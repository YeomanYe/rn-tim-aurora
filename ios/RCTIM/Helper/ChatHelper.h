//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImSDK/TIMManager.h>
#import <React/RCTBridgeModule.h>
#import <ImSDK/ImSDK.h>
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import "TIMCb.h"

@interface ChatHelper : NSObject{

}
+(void)chatWithSingle:(NSString *)receiver;
+(void)chatWithGroup:(NSString *)receiver;
+(void)sendText:(NSString *)text resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)sendImg:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)sendSound:(NSString *)path duration:(NSInteger)duration resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
+(void)sendVideo:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
@end