//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "PromiseUtil.h"


@implementation PromiseUtil {

}
+ (NSDictionary *)createResolve:(NSInteger)code msg:(NSString *)msg {
    NSDictionary *dict = [[NSDictionary alloc] init];
    [dict setValue:@(code) forKey:@"code"];
    [dict setValue:msg forKey:@"msg"];
    return dict;
}

+ (NSDictionary *)createSuccResolve:(NSString *)msg {
    return [PromiseUtil createResolve:200 msg:msg];
}


@end