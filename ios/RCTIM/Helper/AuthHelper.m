//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "AuthHelper.h"


@implementation AuthHelper {

}
+ (void)login:(NSString *)identifier userSig:(NSString *)userSig resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    TIMLoginParam *param = [[TIMLoginParam alloc] init];
    [param setIdentifier:identifier];
    [param setUserSig:userSig];
    [param setAccountType:sdkAccountType];
    [param setAppidAt3rd:sdkAppId];
    [[TIMManager sharedInstance] login:param cb:[[TIMCb alloc] initWithName:@"login" resolve:resolve reject:reject]];
}

+ (void)logout:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    TIMCb *cb = [[TIMCb alloc] initWithName:@"logout" resolve:resolve reject:reject];
    [[TIMManager sharedInstance] logout:^() {
        [cb onSucc];
    } fail:^(int code, NSString * err) {
        [cb onErr:code errMsg:err];
    }];
}


@end