//
//  ResponseCallBack.h
//  ResponseChainFrame
//
//  Created by yao on 16/10/25.
//  Copyright © 2016年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^DoneBlock)(id result, NSUInteger tag);
typedef void (^StartBlock)(void);
typedef void (^ErrorBlock)(id error);

@interface ResponseCallBack : NSObject
@property (nonatomic,copy)DoneBlock doneBlock;
@property (nonnull,copy) ErrorBlock errorBlock;
@end
