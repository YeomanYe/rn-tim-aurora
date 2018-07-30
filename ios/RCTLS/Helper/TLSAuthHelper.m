//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TLSAuthHelper.h"


@implementation TLSAuthHelper {
}
+ (void)initTLS {
    [[QalSDKProxy sharedInstance] initWithAppid:[sdkAppId intValue] andSDKAppid:[sdkAppId intValue] andAccType:[sdkAccountType intValue]];
    [[TLSHelper getInstance]init:[sdkAppId intValue] andAppVer:@"1.0.0.0"];
}

+ (void)register:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    StrAccountRegCb *strAccountRegCb = [[StrAccountRegCb alloc] initWithName:@"register" resolve:resolve reject:reject];
    [[TLSHelper getInstance] TLSStrAccountReg:username andPassword:pass andTLSStrAccountRegListener:strAccountRegCb];
}

+ (void)login:(NSString *)username pass:(NSString *)pass resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    PwdLoginCb *pwdLoginCb = [[PwdLoginCb alloc] initWithName:@"login" resolve:resolve reject:reject];
    [[TLSHelper getInstance] TLSPwdLogin:username andPassword:pass andTLSPwdLoginListener:pwdLoginCb];
}

+ (void)verifyImgCode:(NSString *)code resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    PwdLoginCb *cb = [[PwdLoginCb alloc] initWithName:@"verifyImgCode" resolve:resolve reject:reject];
    [[TLSHelper getInstance] TLSPwdLoginVerifyImgCode:code andTLSPwdLoginListener:cb];
}

+ (void)reaskImgCode:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    PwdLoginCb *cb = [[PwdLoginCb alloc] initWithName:@"reaskImgCode" resolve:resolve reject:reject];
    [[TLSHelper getInstance] TLSPwdLoginReaskImgCode:cb];
}


@end