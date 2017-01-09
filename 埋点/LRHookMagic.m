//
//  LRHookMagic.m
//  埋点
//
//  Created by liurui on 2016/12/27.
//  Copyright © 2016年 liurui. All rights reserved.
//

#import "LRHookMagic.h"
#import <objc/runtime.h>

@implementation LRHookMagic
+(void)swizzlingInClass:(Class)cls originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = cls;
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else
    {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
    
}

@end
