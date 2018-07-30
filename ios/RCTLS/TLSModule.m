//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TLSModule.h"

@implementation TLSModule {

}
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(initTLS){
    [TLSAuthHelper initTLS];
}
RCT_EXPORT_METHOD(register:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper register:username pass:pass resolve:resolve reject:reject];
}
RCT_EXPORT_METHOD(login:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper login:username pass:pass resolve:resolve reject:reject];
}
RCT_EXPORT_METHOD(verifyImgCode:(NSString *)code resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper verifyImgCode:code resolve:resolve reject:reject];
}
RCT_EXPORT_METHOD(reaskImgCode:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [TLSAuthHelper reaskImgCode:resolve reject:reject];
}
@end