//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImSDK/TIMManager.h>
#import <React/RCTBridgeModule.h>
#import "PromiseUtil.h"

@interface BaseCb : NSObject<TIMCallback>{
    NSString *_tagName;
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
}
@property (nonatomic, strong) NSString *tagName;
@property (nonatomic) RCTPromiseResolveBlock resolve;
@property (nonatomic) RCTPromiseRejectBlock reject;
-(instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
@end