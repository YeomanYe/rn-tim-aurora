//
// Created by 美德远健 on 2018/7/24.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "ChatHelper.h"


static TIMConversation *conversation;
@implementation ChatHelper {

}
+(void)createConversation:(TIMConversationType)conversationType receiver:(NSString *)receiver{
    conversation = [[TIMManager sharedInstance] getConversation:conversationType receiver:receiver];
}

+(void)sendMsg:(TIMElem *)elem tagName:(NSString *)tagName resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject{
    TIMMessage * msg = [[TIMMessage alloc] init];
    [msg addElem:elem];
    [conversation sendMessage:msg cb:[[TIMCb alloc] initWithName:tagName resolve:resolve reject:reject]];
}

+ (void)chatWithSingle:(NSString *)receiver {
    [ChatHelper createConversation:TIM_C2C receiver:receiver];
}

+ (void)chatWithGroup:(NSString *)receiver {
    [ChatHelper createConversation:TIM_GROUP receiver:receiver];
}

+ (void)sendText:(NSString *)text resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    TIMTextElem * textElem = [[TIMTextElem alloc] init];
    [textElem setText:text];
    [ChatHelper sendMsg:textElem tagName:@"sendText" resolve:resolve reject:reject];
}

+ (void)sendImg:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    TIMImageElem * imgElem = [[TIMImageElem alloc] init];
    imgElem.path = path;
    [ChatHelper sendMsg:imgElem tagName:@"sendImg" resolve:resolve reject:reject];
}

+ (void)sendSound:(NSString *)path duration:(NSInteger)duration resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    TIMSoundElem * soundElem = [[TIMSoundElem alloc] init];
    [soundElem setPath:path];
    [soundElem setSecond:duration];
    [ChatHelper sendMsg:soundElem tagName:@"sendSound" resolve:resolve reject:reject];
}

+ (void)sendVideo:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    if (!path)
    {
        return ;
    }

    //视频截图
    AVURLAsset *urlAsset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:path] options:nil];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:urlAsset];
    imageGenerator.appliesPreferredTrackTransform = YES;    // 截图的时候调整到正确的方向
    CMTime time = CMTimeMakeWithSeconds(1.0, 30);   // 1.0为截取视频1.0秒处的图片，30为每秒30帧
    CGImageRef cgImage = [imageGenerator copyCGImageAtTime:time actualTime:nil error:nil];
    UIImage *image = [UIImage imageWithCGImage:cgImage];

    UIGraphicsBeginImageContext(CGSizeMake(240, 320));
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0,0, 240, 320)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    NSData *snapshotData = UIImageJPEGRepresentation(scaledImage, 0.75);

    //保存截图到临时目录
    NSString *tempDir = NSTemporaryDirectory();
    NSString *snapshotPath = [NSString stringWithFormat:@"%@%3.f", tempDir, [NSDate timeIntervalSinceReferenceDate]];

    NSError *err;
    NSFileManager *fileMgr = [NSFileManager defaultManager];

    if (![fileMgr createFileAtPath:snapshotPath contents:snapshotData attributes:nil])
    {
        NSString *msg = [[NSString alloc] initWithFormat:@"Upload Image Failed: fail to create uploadfile: %@", err];
        NSLog(msg);
        reject(@"410",msg,err);
        return ;
    }

    //创建 TIMVideoElem
    TIMVideoElem* elem = [[TIMVideoElem alloc] init];
    TIMVideo* video = [[TIMVideo alloc] init];
    TIMSnapshot* snapshot = [[TIMSnapshot alloc] init];
    elem.video = video;
    elem.snapshot = snapshot;
    elem.videoPath = path;
    elem.snapshotPath = snapshotPath;

    video.type = @"mp4";
    video.duration = (int)urlAsset.duration.value/urlAsset.duration.timescale;
    snapshot.type = @"kTypeSnapshot";//截图类型，用户自定义
    snapshot.width = scaledImage.size.width;
    snapshot.height = scaledImage.size.height;
    [ChatHelper sendMsg:elem tagName:@"sendVideo" resolve:resolve reject:reject];
}


@end