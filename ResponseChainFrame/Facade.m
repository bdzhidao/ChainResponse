//
//  Facade.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "Facade.h"
#import "NetEngineFactory.h"
@interface Facade()
@property(nonatomic, readwrite, strong) NetEngineFactory *networkEngine;
@property(nonatomic,strong)ResponseCallBack *callBack;
@end
@implementation Facade
+(Facade *)sharedInstance
{
    static Facade *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[Facade alloc] init];
    });
    return sharedManager;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.networkEngine = [[NetEngineFactory alloc] init];
         self.callBack = [[ResponseCallBack alloc] init];
    }
    return self;
}
//- (void)startProcessor1:(Processor *)processor doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock{
//    self.callBack.doneBlock =  doneBlock;
//    self.callBack.errorBlock = failedBlock;
//    NetBaseTask *task = [[NetBaseTask alloc] init];
//    task.delegate = processor;
//    task.taskName = NSStringFromClass([task.delegate class]);
//    task.callBack = self.callBack;
//    [self.networkEngine startRequest:task];
//}
//- (void)startProcessor:(id(^)(void))startBlock
//             doneBlock:(void (^)(id result, NSUInteger tag))doneBlock
//            failedDone:(void(^)(id error))failedBlock{
//    self.callBack.doneBlock =  doneBlock;
//    self.callBack.errorBlock = failedBlock;
//    NetBaseTask *task = [[NetBaseTask alloc] init];
//    task.delegate = startBlock();
//    task.taskName = NSStringFromClass([task.delegate class]);
//    task.callBack = self.callBack;
//    [self.networkEngine startRequest:task];
//}
//- (void)startPro1:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock{
//    self.callBack.doneBlock =  doneBlock;
//    NetTask1 *task1 = [[NetTask1 alloc] init];
//    task1.taskName = @"task1";
//    task1.delegate = startBlock();
//    task1.callBack = self.callBack;
//    [self.networkEngine startRequest:task1];
//
//}
//
//
//- (void)startProcessor2:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock{
//    self.callBack.doneBlock =  doneBlock;
//    NetTask2 *task2 = [[NetTask2 alloc] init];
//    task2.taskName = @"task2";
//    task2.delegate = startBlock();
//    task2.callBack = self.callBack;
//    
//    [self.networkEngine startRequest:task2];
//}
//- (void)startProcessor3:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock{
//    self.callBack.doneBlock =  doneBlock;
//    NetTask3 *task3 = [[NetTask3 alloc] init];
//    task3.taskName = @"task3";
//    task3.delegate = startBlock();
//
//    task3.callBack = self.callBack;
//    [self.networkEngine startRequest:task3];
//}
//- (void)startProcessorFinish:(id(^)(void))startBlock doneBlock:(void (^)(id result, NSUInteger tag))doneBlock{
//    self.callBack.doneBlock =  doneBlock;
//    NetTaskFinish *task = [[NetTaskFinish alloc] init];
//    task.taskName = @"task finish";
//    task.delegate = startBlock();
//
//    task.callBack = self.callBack;
//
//    [self.networkEngine startRequest:task];
//}
@end
