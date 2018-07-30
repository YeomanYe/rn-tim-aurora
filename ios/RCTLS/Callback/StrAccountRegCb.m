//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "StrAccountRegCb.h"


@implementation StrAccountRegCb {

}
- (instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    self.name = name;
    self.resolve = resolve;
    self.reject = reject;
    return self;
}

- (void)OnStrAccountRegSuccess:(TLSUserInfo *)userInfo {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ succ.",_name];
    _resolve([PromiseUtil createSuccResolve:msg]);
}

- (void)OnStrAccountRegFail:(TLSErrInfo *)errInfo {
    [self rejectWithTLSErrInfo:errInfo];
}

- (void)OnStrAccountRegTimeout:(TLSErrInfo *)errInfo {
    [self rejectWithTLSErrInfo:errInfo];
}

- (void)rejectWithTLSErrInfo:(TLSErrInfo *)errInfo{
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ fail. code:%d ,msg:%@",_name, [errInfo dwErrorCode], [errInfo sErrorMsg]];
    [PromiseUtil rejectWithMsg:_reject msg:msg];
}
@end