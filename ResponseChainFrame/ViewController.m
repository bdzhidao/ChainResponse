//
//  ViewController.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "ViewController.h"
#import "ChainEngine.h"
#import "Processor.h"
@interface ViewController ()
@property (nonatomic,strong) Processor *processor1;
@property (nonatomic,strong) Processor *processor2;
@property (nonatomic,strong) Processor *processor3;
@property (nonatomic,strong) Processor *processFinish;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *processorArray = [NSMutableArray new];
    [processorArray addObject:self.processor1];
    [processorArray addObject:self.processor2];
    [processorArray addObject:self.processor3];
    [processorArray addObject:self.processFinish];

    ChainEngine *engine = [ChainEngine new];
    [engine startTaskWithArray:processorArray
                 taskAllFinish:^{
        NSLog(@"任务全部结束");
    } taskCancel:^{
        NSLog(@"任务错误，提前结束");
    }];
}

- (Processor *)processor1{
    if (!_processor1) {
        _processor1 = [[Processor processorBuilder]
                       sendRequestWithUrl:@"url1"
                       withParam:@{@"fitst1":@"value1"}
                       finishDone:^(id result, NSUInteger tag) {
                           NSLog(@"processor1 end,handle processor1 operation\n\n");
                           _processor1.param = @{@"k1":@"v1"};
                       } failedDone:^(id error) {
                           NSLog(@"processor1 error\n\n");
                       }];

    }
    return _processor1;
}

- (Processor *)processor2{
    if (!_processor2) {
        _processor2 = [[Processor processorBuilder]
                       sendRequestWithUrl:@"url2"
                       withParam:nil
                       finishDone:^(id result, NSUInteger tag) {
                           _processor2.param = @{@"k2":@"v2"};
                           NSLog(@"processor2 end,handle processor2 operation\n\n");
                       }
                       failedDone:^(id error) {
                           NSLog(@"processor2 error\n\n");
                       }];
    }
    return _processor2;
}
- (Processor *)processor3{
    if (!_processor3) {
        _processor3 = [[Processor processorBuilder]
                       sendRequestWithUrl:@"url3"
                       withParam:nil
                       finishDone:^(id result, NSUInteger tag) {
                           _processor3.param = @{@"k3":@"v3"};
                           NSLog(@"processor3 end,handle processor3 operation\n\n");
                       }
                       failedDone:^(id error) {
                           NSLog(@"processor3 error\n\n");
                       }];
    }
    return _processor3;
}
- (Processor *)processFinish{
    if (!_processFinish) {
        _processFinish = [[Processor processorBuilder]
                          sendRequestWithUrl:@"urlfinish"
                          withParam:nil
                          finishDone:^(id result, NSUInteger tag) {
                              _processFinish.param = @{@"kf":@"vf"};
                              NSLog(@"ProcessorFinish end,handle ProcessorFinish operation\n\n");
                          }
                          failedDone:^(id error) {
                              NSLog(@"ProcessorFinish error\n\n");
                          }];
    }
    return _processFinish;
}
@end
