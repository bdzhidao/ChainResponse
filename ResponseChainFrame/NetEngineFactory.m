//
//  NetEngine.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "NetEngineFactory.h"
@implementation NetEngineFactory
+(NetEngineFactory *)sharedInstance
{
    static NetEngineFactory *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[NetEngineFactory alloc] init];
    });
    return sharedManager;
}
+ (instancetype)createNetFactory{
    return self.new;
}
//- (void)startRequest :(NetBaseTask *)task{
//    task.taskType = @"asi";
//    NSLog(@"%@ nettask请求开始",task.taskName);
//    ResponseCallBack *callBack = task.callBack;
//    NSLog(@"%@ nettask请求结束",task.taskName);
//    Processor *processor = (Processor *)task.delegate;
//    NSLog(@"param:%@",processor.param);
//    NSLog(@"url:%@",processor.url);
//    //!callBack.doneBlock ?: callBack.doneBlock(@"finish",1);
//    if (callBack.doneBlock) {
//       callBack.doneBlock(@"finish",1);
//        if ([processor.delegate respondsToSelector:@selector(handleNextProcessor:)]) {
//            [processor.delegate handleNextProcessor:processor];
//        }
//    }
////    if (callBack.errorBlock) {
////        if ([processor.delegate respondsToSelector:@selector(cancelProcessor:)]) {
////            [processor.delegate cancelProcessor:processor];
////        }
////    }
//}
- (void)startRequest:(Processor *)processor doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock{
   
}
- (void)finish{

}
- (void)cancel{

}
@end
