//
//  NetEngine.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Processor.h"

@interface NetEngineFactory : NSObject

- (void)startRequest:(Processor *)processor doneBlock:(void (^)(id result, NSUInteger tag))doneBlock failedDone:(void(^)(id error))failedBlock;
+ (instancetype)createNetFactory;
- (void)finish;
- (void)cancel;
@end
