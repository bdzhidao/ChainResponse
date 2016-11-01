//
//  Facade.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseCallBack.h"
@class Processor;
@interface Facade : NSObject
+(Facade *)sharedInstance;
//- (void)startPro1:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
////- (void)startProcessor2:(id)delegate doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
//- (void)startProcessor2:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
////- (void)startProcessorFinish:(id)delegate doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
//- (void)startProcessorFinish:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
//    
////- (void)startProcessor3:(id)delegate doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
//- (void)startProcessor3:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock;
- (void)startProcessor:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock;
- (void)startProcessor1:(Processor *)processor doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock;
@end
