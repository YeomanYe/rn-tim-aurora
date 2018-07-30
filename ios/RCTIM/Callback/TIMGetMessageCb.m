//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "TIMGetMessageCb.h"

TIMMessage *lastHistoryMsg;
@implementation TIMGetMessageCb {

}
-(void)dealELem:(NSDictionary *)dict elem:(TIMElem *)elem{
    NSString *msgType;
    if ([elem isKindOfClass:[TIMTextElem class]]) {
        TIMTextElem * textElem = (TIMTextElem * )elem;
        msgType = @"text";
        [dict setValue:[textElem text] forKey:@"text"];
    }
    else if ([elem isKindOfClass:[TIMImageElem class]]) {
        TIMImageElem * imgElem = (TIMImageElem * )elem;
        msgType = @"image";
        [dict setValue:[imgElem path] forKey:@"path"];
    }else if([elem isKindOfClass:[TIMSoundElem class]]){
        TIMSoundElem *soundElem = (TIMSoundElem *)elem;
        msgType = @"voice";
        [dict setValue:[soundElem path] forKey:@"path"];
        [dict setValue:@([soundElem second]) forKey:@"duration"];
    }else if([elem isKindOfClass:[TIMVideoElem class]]){
        TIMVideoElem *videoElem = (TIMVideoElem *)elem;
        msgType = @"video";
        [dict setValue:[videoElem videoPath] forKey:@"path"];
    }
    [dict setValue:msgType forKey:@"msgType"];
}
/**
 *  消息读取成功
 *
 *  @param msgs 消息列表，TIMMessage 数组
 */
- (void) onSucc:(NSArray *) msgs{
    NSString *sucMsg = [[NSString alloc] initWithFormat:@"%@ succ.",self.tagName];
    NSLog(sucMsg);
    NSDictionary *dict = [[NSDictionary alloc] init];
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [dict setValue:@(200) forKey:@"code"];
    [dict setValue:sucMsg forKey:@"msg"];
    for(NSUInteger i=0,len=[msgs count];i<len;i++){
        NSDictionary *msgDict = [[NSDictionary alloc] init];
        TIMMessage *m = msgs[i];
        [msgDict setValue:[m timestamp] forKey:@"timestamp"];
        [msgDict setValue:[m msgId] forKey:@"msgId"];
        [msgDict setValue:@"send_succeed" forKey:@"status"];
        NSDictionary *userDict = [[NSDictionary alloc] init];
        if([m isSelf]){
            [msgDict setValue:@(YES) forKey:@"isOutgoing"];
            [userDict setValue:[m sender] forKey:@"userId"];
        }else{
            [msgDict setValue:@(NO) forKey:@"isOutgoing"];
            [userDict setValue:@"" forKey:@"userId"];
        }
        [userDict setValue:@"images" forKey:@"avatarPath"];
        [userDict setValue:@"" forKey:@"displayName"];
        [msgDict setValue:userDict forKey:@"fromUser"];
        [self dealELem:msgDict elem:[m getElem:0]];
        [mArray addObject:msgDict];
        lastHistoryMsg = m;
    }
    [dict setValue:[mArray copy] forKey:@"timMsg"];
}

/**
 *  消息发送失败
 *
 *  @param errCode 失败错误码
 *  @param errMsg  失败错误描述
 */
- (void)onErr:(int)errCode errMsg:(NSString *)errMsg {
    NSString *msg = [[NSString alloc] initWithFormat:@"%@ Failed: code=%d, err=%@", self.tagName,errCode, errMsg];
    [PromiseUtil rejectWithMsg:self.reject msg:msg];
}
-(instancetype)initWithName:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    self.tagName = name;
    self.resolve = resolve;
    self.reject = reject;
    return self;
}
@end
