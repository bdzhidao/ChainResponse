//
//  ResponseEngine.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ChainEngine : NSObject
//- (void)startTaskWithArray:(NSMutableArray *)processorArray;
- (void)startTaskWithArray:(NSMutableArray *)processorArray
             taskAllFinish:(void(^)(void))taskAllFinish
                taskCancel:(void(^)(void))taskCancel;
@end
