//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TIMCb.h"


@implementation TIMCb {

}
-(instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    self.tagName = name;
    self.resolve = resolve;
    self.reject = reject;
    return self;
}
- (void)onSucc {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ succ.",self.tagName];
    self.resolve([PromiseUtil createSuccResolve:msg]);
}

- (void)onErr:(int)errCode errMsg:(NSString *)errMsg {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ Failed: code=%d, err=%@", self.tagName,errCode, errMsg];
    NSLog(msg);
    [PromiseUtil rejectWithMsg:self.reject msg:msg];
}


@end