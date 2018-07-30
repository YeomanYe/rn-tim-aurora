//
// Created by 美德远健 on 2018/7/30.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TLSSDK/TLSPwdLoginListener.h>
#import <React/RCTBridgeModule.h>
#import "PromiseUtil.h"

@interface PwdLoginCb : NSObject<TLSPwdLoginListener>{
    NSString *_name;
    RCTPromiseResolveBlock _resolve;
    RCTPromiseRejectBlock _reject;
}
@property (nonatomic) NSString *name;
@property (nonatomic) RCTPromiseResolveBlock resolve;
@property (nonatomic) RCTPromiseRejectBlock reject;
-(instancetype) initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject;
/**
*  密码登陆要求验证图片验证码
*
*  @param picData 图片验证码
*  @param errInfo 错误信息
*/
-(void)	OnPwdLoginNeedImgcode:(NSData *)picData andErrInfo:(TLSErrInfo *)errInfo;

/**
 *  密码登陆请求图片验证成功
 *
 *  @param picData 图片验证码
 */
-(void)	OnPwdLoginReaskImgcodeSuccess:(NSData *)picData;

/**
 *  密码登陆成功
 *
 *  @param userInfo 用户信息
 */
-(void)	OnPwdLoginSuccess:(TLSUserInfo *)userInfo;

/**
 *  密码登陆失败
 *
 *  @param errInfo 错误信息
 */
-(void)	OnPwdLoginFail:(TLSErrInfo *)errInfo;

/**
 *  秘密登陆超时
 *
 *  @param errInfo 错误信息
 */
-(void)	OnPwdLoginTimeout:(TLSErrInfo *)errInfo;
@end