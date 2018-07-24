//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "ConfigHelper.h"


@implementation ConfigHelper {

}
+ (void)initSDK {
    TIMManager *manager = [TIMManager sharedInstance];
    [manager disableCrashReport];
    [manager setLogLevel:TIM_LOG_DEBUG];
    [manager initLogSettings:true logPath:[manager getLogPath]];
    [manager initSdk:[sdkAppId intValue]];
}

@end