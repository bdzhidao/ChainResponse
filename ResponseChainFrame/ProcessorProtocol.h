//
//  ProcessorProtocol.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProcessorProtocol <NSObject>
@optional
- (void)handleNextProcessor:(id)processor;
- (void)cancelProcessor:(id)processor;
- (void)startCurrentProcessor;
@end
