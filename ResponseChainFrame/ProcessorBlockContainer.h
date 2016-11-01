//
//  ProcessorBlockContainer.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/27.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProcessorBlockContainer : NSObject
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, id /*block*/> *privateMethodBlockMap;

- (instancetype)registerBlock:(id)block forSelector:(SEL)selector;
- (id)blockForSelector:(SEL)selector;

@end
