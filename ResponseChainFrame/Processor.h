//
//  Processor.h
//  ResponseChainFrame
//
//  Created by yao on 16/11/1.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessorProtocol.h"
#import "ProcessorBlockContainer.h"
@interface Processor : ProcessorBlockContainer<ProcessorProtocol>

@property(nonatomic, weak) id<ProcessorProtocol> delegate;
@property(nonatomic, strong) NSDictionary *param;
@property(nonatomic, copy) NSString *url;
//- (instancetype)startDone:(id(^)(void))startBlock;
- (instancetype)startTask:(id(^)(void))startBlock;
- (instancetype)sendRequestWithUrl:(NSString *)url withParam:(NSDictionary *)param;
- (instancetype)finishDone:(void(^)(id result, NSUInteger tag))doneBlock;
- (instancetype)failedDone:(void(^)(id error))failedBlock;
//- (instancetype)startTask:(id(^)(void))startBlock finishDone:(void(^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock;
- (instancetype)sendRequestWithUrl:(NSString *)url withParam:(NSDictionary *)param finishDone:(void(^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock;
+ (instancetype)processorBuilder;


@end
