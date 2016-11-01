//
//  NetBaseTask.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseCallBack.h"
@interface NetBaseTask : NSObject
@property(nonatomic, weak) id delegate;
@property(nonatomic,strong)ResponseCallBack *callBack;
@property (nonatomic,copy)NSString *taskName;
@property (nonnull,copy) NSString *taskType;

@end
