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
    [[TIMManager sharedInstance] login:param cb:<#(id<TIMCallback>)cb#>];
}

@end