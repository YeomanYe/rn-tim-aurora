//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImSDK/ImSDK.h>
#import <React/RCTBridgeModule.h>


@interface TIMGetMessageCb : NSObject<TIMGetMessageCallback>{
    NSString *_tagName;
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
}
@property (nonatomic, strong) NSString *tagName;
@property (nonatomic) RCTPromiseResolveBlock resolve;
@property (nonatomic) RCTPromiseRejectBlock reject;
-(instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
@end