//
//  NetBaseTask.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "NetBaseTask.h"
@interface NetBaseTask()
@property (nonatomic,strong)NSDictionary *dict;
- (instancetype)initWithParam:(NSDictionary *)dict;
@end
@implementation NetBaseTask
- (instancetype)initWithParam:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.dict = dict;
    }
    return self;
}
@end
