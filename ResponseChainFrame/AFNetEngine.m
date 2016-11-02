//
//  AFNetEngine.m
//  ResponseChainFrame
//
//  Created by yao on 16/11/1.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "AFNetEngine.h"

@implementation AFNetEngine

- (void)startRequest:(Processor *)processor doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock{
    NSLog(@"%@ afnet request nettask请求开始",NSStringFromClass([processor class]));
    //发起请求 [self sendrequest];
    if (doneBlock) {
        NSLog(@"%@ afnet request nettask请求结束",NSStringFromClass([processor class]));
//        NSLog(@"param:%@",processor.param);
//        NSLog(@"url:%@",processor.url);
        doneBlock(@"finish",1);
        if ([processor.delegate respondsToSelector:@selector(handleNextProcessor:)]) {
            [processor.delegate handleNextProcessor:processor];
        }
    }
    if (failedBlock) {
        if ([processor.delegate respondsToSelector:@selector(cancelProcessor:)]) {
            [processor.delegate cancelProcessor:processor];
        }
    }
    
}
-(void)finish{
    
}
-(void)cancel{

}
@end
