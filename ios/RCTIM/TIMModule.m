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
    [TLSAuthHelper login:identifier userSig:userSig resolve:resolve reject:reject];
}
RCT_EXPORT_METHOD(logout:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper logout:resolve reject:reject];
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

RCT_EXPORT_METHOD(getHistoryMsg:(NSInteger)count resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper getHistoryMsg:count resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(loginTest10010:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper login:@"test10010" userSig:@"eJx1kEFPwjAUgO-7FU2vGHXdZpkJB1OG1kwHdkDw0ixrqYUAtSvJBuG-s0wTd-Fdvy-ve3lnDwAA85TdFmV5OO4dd42REDwCiGMEb-6wMVrwwvHAig774X07fhQEPUvWRlvJi7WTtrNQFKNW6ylayL3Ta-0rOFk5v93TVyqx5V3v-1ClVQffkjmhM7JMiqU7ZWmMKZYTmW1pemdZpFm5SSxVc5IPY1aTw-j0RNX0xTazRuzKUFFTP3*tMEHf7-lisGELcxw-TF8V*Zh81hlZjXpJp3c-j2lPQaGPh2EAvYt3BYACV7o_" resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(loginTest10011:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper login:@"test10011" userSig:@"eJx1kE1PhDAQQO-8iqZnI-QDKSYecDG67mpWWCR4aRooWHcXsNS6xvjfJWgiF*f6XuZN5tMBAMDtOj0VZdm9tYabj15CcA5gEGJ48of7XlVcGE50NWFEvXGQT8jMksdeaclFbaSeLOyHeNRmiqpka1StfgUjB4PGPWimDNWOT73-Q4NqJnh3lS2WD7HdJ110bCLtZrdlOujAtlGa34h9v6ObIo9XOPDYWdHap-dlk9wXi01iTXxwV3Ww1V0hMoofry-X4TPJPfbiW-GKUpeU9GKWNOrw85jxFEwRY4RB58v5Bn4RVww_" resolve:resolve  reject:reject];
}
@end