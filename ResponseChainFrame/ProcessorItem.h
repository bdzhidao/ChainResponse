//
//  ProcessorItem.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Processor;
@interface ProcessorItem : NSObject
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) Processor *currentProcessor;
@property (nonatomic,strong) Processor *nextProcessor;

@end
