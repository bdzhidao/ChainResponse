//
//  ProcessorBlockContainer.m
//  ResponseChainFrame
//
//  Created by yao on 16/10/27.
//  Copyright © 2016年 yao. All rights reserved.
//

#import "ProcessorBlockContainer.h"

@implementation ProcessorBlockContainer
- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    // TODO: filter SEL
    if ([NSStringFromSelector(selector) isEqualToString:@"registerBlock:forSelector:"]) {
        return [super methodSignatureForSelector:selector];
    }
    return [self methodSignatureForSelector:@selector(registerBlock:forSelector:)];
    //    struct objc_method_description methodDescription = protocol_getMethodDescription(@protocol(FDTableViewSectionBuildable), selector, YES, YES);
    //    if (methodDescription.name) {
    //        // Forward to common call, see "-forwardInvocation:" next.
    //        return [self methodSignatureForSelector:@selector(registerBlock:forSelector:)];
    //    }
    //    return [super methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL originalSelector = invocation.selector;
    SEL forwardingSelector = @selector(registerBlock:forSelector:);
    // Original invocation (like -heightForCell:)
    // arg0 -> self
    // arg1 -> originalSelector
    // arg2 -> block
    // Forwarding invocation (-registerBlock:forSelector:)
    // arg0 -> self
    // arg1 -> forwardingSelector
    // arg2 -> block
    // arg3 -> originalSelector
    //target: {@} 0x6080000250a0
    //selector: {:} startDone:
    //argument 2: {@} 0x7fff5132c948
    //argument 3: {:} pÄ'
    invocation.selector = forwardingSelector; // arg1
    [invocation setArgument:&originalSelector atIndex:3];
    
    [invocation invoke];
}

@synthesize privateMethodBlockMap = _privateMethodBlockMap;

- (NSMutableDictionary<NSString *, id> *)privateMethodBlockMap {
    if (!_privateMethodBlockMap) {
        _privateMethodBlockMap = @{}.mutableCopy;
    }
    return _privateMethodBlockMap;
}

- (instancetype)registerBlock:(id)block forSelector:(SEL)selector {
    id copyBlock = [block copy];
    self.privateMethodBlockMap[NSStringFromSelector(selector)] = copyBlock;
    return self;
}

- (id)blockForSelector:(SEL)selector {
    return self.privateMethodBlockMap[NSStringFromSelector(selector)];
}
@end
