//
//  Processor.m
//  ResponseChainFrame
//
//  Created by yao on 16/11/1.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "Processor.h"
#import "NetEngineFactory.h"
#import "Facade.h"
#import "NetEngineFactory.h"
#import "Processor.h"
#import "ASINetEngine.h"
#import "AFNetEngine.h"
@implementation Processor
- (void)finishCurrentProcessor{
    if ([self.delegate respondsToSelector:@selector(handleNextProcessor:)]) {
        [self.delegate handleNextProcessor:self];
    }
}
- (instancetype)sendRequestWithUrl:(NSString *)url withParam:(NSDictionary *)param{
    self.url = url;
    self.param = param;
    return self;
}
- (instancetype)sendRequestWithUrl:(NSString *)url withParam:(NSDictionary *)param finishDone:(void(^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock{
    return [[[self sendRequestWithUrl:url withParam:param] finishDone:doneBlock] failedDone:failedBlock];
}
//- (instancetype)startTask:(id(^)(void))startBlock finishDone:(void(^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock{
//    return  [[[self startTask:startBlock] finishDone:doneBlock] failedDone:failedBlock];
//}
+ (instancetype)processorBuilder {
    return self.new;
}
//- (void)startCurrentProcessorWithParam{
//    void(^finishBlock)(id result, NSUInteger tag) = [self blockForSelector:@selector(finishDone:)];
//    id (^startBlock)(void) = [self blockForSelector:@selector(startTask:)];
//   // void(^startBlock)(BaseProcessor *processor) = [self blockForSelector:@selector(startTask:)];
//    void (^failedBlock)(id error) = [self blockForSelector:@selector(failedDone:)];
//    if (finishBlock && startBlock) {
//        [[Facade sharedInstance] startProcessor:startBlock doneBlock:finishBlock failedDone:failedBlock];
//    }
//}
- (void)startCurrentProcessor{
    void(^finishBlock)(id result, NSUInteger tag) = [self blockForSelector:@selector(finishDone:)];
    void (^failedBlock)(id error) = [self blockForSelector:@selector(failedDone:)];
    if (finishBlock) {
       // [[Facade sharedInstance] startProcessor1:self doneBlock:finishBlock failedDone:failedBlock];
       // [[NetEngineFactory sharedInstance] startRequest:self doneBlock:finishBlock failedDone:failedBlock];
       [[ASINetEngine createNetFactory] startRequest:self doneBlock:finishBlock failedDone:failedBlock];
        
    }
    
}
@end
