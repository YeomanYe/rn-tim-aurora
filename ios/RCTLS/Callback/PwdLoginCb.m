//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <TLSSDK/TLSHelper.h>
#import "PwdLoginCb.h"


@implementation PwdLoginCb {

}
- (instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    self.name = name;
    self.resolve = resolve;
    self.reject = reject;
    return self;
}

- (void)OnPwdLoginNeedImgcode:(NSData *)picData andErrInfo:(TLSErrInfo *)errInfo {
    [self rejectWithTLSErrInfo:errInfo];
}

- (void)OnPwdLoginReaskImgcodeSuccess:(NSData *)picData {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ succ.",_name];
    _resolve([PromiseUtil createSuccResolve:msg]);
}

- (void)OnPwdLoginSuccess:(TLSUserInfo *)userInfo {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ succ.",_name];
    NSString *userSig = [[TLSHelper getInstance] getTLSUserSig:[userInfo identifier]];
    NSDictionary *dict = [PromiseUtil createSuccResolve:msg];
    [dict setValue:userSig forKey:@"userSig"];
    _resolve(dict);
}

- (void)OnPwdLoginFail:(TLSErrInfo *)errInfo {
    [self rejectWithTLSErrInfo:errInfo];
}

- (void)OnPwdLoginTimeout:(TLSErrInfo *)errInfo {
    [self rejectWithTLSErrInfo:errInfo];
}

- (void)rejectWithTLSErrInfo:(TLSErrInfo *)errInfo{
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ fail. code:%d ,msg:%@",_name, [errInfo dwErrorCode], [errInfo sErrorMsg]];
    [PromiseUtil rejectWithMsg:_reject msg:msg];
}
@end