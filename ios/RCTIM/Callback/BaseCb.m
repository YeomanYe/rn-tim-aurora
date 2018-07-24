//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "BaseCb.h"


@implementation BaseCb {

}
-(instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    self.tagName = name;
    self.resolve = resolve;
    self.reject = reject;
    return self;
}
- (void)onSucc {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ succ.",self.tagName];
    NSLog(msg);
    self.resolve([PromiseUtil createSuccResolve:msg]);
}

- (void)onErr:(int)errCode errMsg:(NSString *)errMsg {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ Failed: code=%d, err=%@", self.tagName,errCode, errMsg];
    NSLog(msg);
    NSError *error = [[NSError alloc] initWithDomain:msg code:500 userInfo:nil];
    self.reject(@"500",msg,error);
}


@end