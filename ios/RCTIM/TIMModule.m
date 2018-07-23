//
// Created by 美德远健 on 2018/7/23.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TIMModule.h"


@implementation TIMModule {

}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initSDK){
    [ConfigHelper initSDK];
}

@end