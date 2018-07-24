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

RCT_EXPORT_METHOD(getHistoryMsg:(NSInteger)count resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [ChatHelper getHistoryMsg:count resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(loginTest10010:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [AuthHelper login:@"test10010" userSig:@"eJx1kEFPwjAUgO-7FU2vGHXdZpkJB1OG1kwHdkDw0ixrqYUAtSvJBuG-s0wTd-Fdvy-ve3lnDwAA85TdFmV5OO4dd42REDwCiGMEb-6wMVrwwvHAig774X07fhQEPUvWRlvJi7WTtrNQFKNW6ylayL3Ta-0rOFk5v93TVyqx5V3v-1ClVQffkjmhM7JMiqU7ZWmMKZYTmW1pemdZpFm5SSxVc5IPY1aTw-j0RNX0xTazRuzKUFFTP3*tMEHf7-lisGELcxw-TF8V*Zh81hlZjXpJp3c-j2lPQaGPh2EAvYt3BYACV7o_" resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(loginTest10011:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [AuthHelper login:@"test10011" userSig:@"eJx1kFFPgzAUhd-5FaSvMwIFVEx8qNop6tjcurm3htAWO3Dr4I5sMf53GzSRF*-r9*Wck-vpuK6L2MviPC*K3WELHE5GIvfaRZcJRmd-2BgteA48bESPg8i3F8RhOLDk0ehG8lyBbHoLxwm22kDRQm5BK-0rgGwhsDnBQGlFxfu*-4taXfZwQpd36XgpdjnQ2ofnR2-lsftVtvDL*sHgafcmYxXts*p2TkaVeiKaksN0RutkT9mFdyLvmHRpNvZY8Qojs1lHZTKp5t16tsmYSm8GlaA-fh5jp*AouLKTkPPlfANBYVbk" resolve:resolve  reject:reject];
}
@end