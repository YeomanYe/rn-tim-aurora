//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TIMModule.h"


@implementation TIMModule {

}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initSDK){
    [ConfigHelper initSDK];
}

RCT_EXPORT_METHOD(login:(NSString *)identifier userSig:(NSString *)userSig resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [AuthHelper login:identifier userSig:userSig resolve:resolve reject:reject];
}
RCT_EXPORT_METHOD(logout:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [AuthHelper logout:resolve reject:reject];
}
RCT_EXPORT_METHOD(chatWithSingle:(NSString *)receiver){
    [ChatHelper chatWithSingle:receiver];
}
RCT_EXPORT_METHOD(chatWithGroup:(NSString *)receiver){
    [ChatHelper chatWithGroup:receiver];
}
RCT_EXPORT_METHOD(sendText:(NSString *)text resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper sendText:text resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(sendImg:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper sendImg:path resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(sendSound:(NSString *)path duration:(NSInteger)duration resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper sendSound:path duration:duration resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(sendVideo:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper sendVideo:path resolve:resolve reject:reject];
}
@end