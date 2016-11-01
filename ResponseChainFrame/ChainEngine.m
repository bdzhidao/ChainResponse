//
//  ResponseEngine.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "ChainEngine.h"
#import "ProcessorItem.h"
#import "Processor.h"
#import "ProcessorProtocol.h"

//@interface ProcessorItem : NSObject
//@end
@interface ChainEngine()<ProcessorProtocol>
@property (nonatomic,strong) NSMutableArray *processorItemArray;
@property (nonatomic,copy) void(^taskAllFinish)(void);
@property (nonatomic,copy) void(^taskCancel)(void);

@end
@implementation ChainEngine
- (id)init{
    self = [super init];
    if (self) {
        self.processorItemArray = [NSMutableArray new];
    }
    return self;
}

- (void)start{
    ProcessorItem *item = [self.processorItemArray firstObject];
    if (item) {
       // item.currentProcessor.param = nil;
        [item.currentProcessor startCurrentProcessor];
    }
}
- (void)startTaskWithArray:(NSMutableArray *)processorArray{
    NSLog(@"任务开始");
    for (NSInteger index = 0; index < processorArray.count ; index++) {
        ProcessorItem *item = [ProcessorItem new];
        item.currentProcessor = processorArray[index];
        item.currentProcessor.delegate = self;
        if (index == processorArray.count - 1) {
            item.nextProcessor = nil ;
        }else{
            item.nextProcessor = processorArray[index + 1];
        }
        [self.processorItemArray addObject:item];
    }
    [self start];

}
- (void)startTaskWithArray:(NSMutableArray *)processorArray
             taskAllFinish:(void(^)(void))taskAllFinish
                taskCancel:(void(^)(void))taskCancel{
    self.taskAllFinish = taskAllFinish;
    self.taskCancel = taskCancel;
    [self startTaskWithArray:processorArray];
 
}
- (ProcessorItem *)findCurrentProcesssorItem:(Processor *)processor{
    ProcessorItem *currentItem = nil ;
    for (NSInteger index = 0; index < self.processorItemArray.count; index++) {
        ProcessorItem *item = self.processorItemArray[index];
        if ([item.currentProcessor isEqual:processor]) {
            currentItem = item;
            break;
        }
    }
    return currentItem;
}

#pragma mark -- ProcessorProtocol
- (void)handleNextProcessor:(id)processor{
    Processor *por = (Processor *)processor;
    ProcessorItem *currentItem = [self findCurrentProcesssorItem:por];
    if (currentItem.nextProcessor) {
        //currentItem.nextProcessor.param = por.param;
        [currentItem.nextProcessor startCurrentProcessor];
    }else{
        [self finish];
    }
}
- (void)cancelProcessor:(id)processor{
    NSString *processName = NSStringFromClass([processor class]);
    NSLog(@"%@请求错误",processName);
    [self cancel];
}
- (void)finish{
    //NSLog(@"任务结束");
    !self.taskAllFinish ?: self.taskAllFinish();
}
- (void)cancel{
    //NSLog(@"任务提前结束");
    !self.taskCancel ?: self.taskCancel();
}
@end
