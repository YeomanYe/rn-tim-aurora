//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "PromiseUtil.h"
#import "TLSSDK/TLSStrAccountRegListener.h"

@interface StrAccountRegCb : NSObject<TLSStrAccountRegListener>{
    NSString *_name;
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
}
@property (nonatomic) NSString *name;
@property (nonatomic) RCTPromiseResolveBlock  resolve;
@property (nonatomic) RCTPromiseRejectBlock reject;
-(instancetype) initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
/**
*  注册成功
*/
-(void)	OnStrAccountRegSuccess:(TLSUserInfo*)userInfo;


/**
 *  注册失败
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegFail:(TLSErrInfo *) errInfo;

/**
 *  注册超时
 *
 *  @param errInfo 错误信息
 */
-(void)	OnStrAccountRegTimeout:(TLSErrInfo *) errInfo;
@end