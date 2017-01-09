//
//  LRHookMagic.h
//  埋点
//
//  Created by liurui on 2016/12/27.
//  Copyright © 2016年 liurui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRHookMagic : NSObject
+(void)swizzlingInClass:(Class)cls originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector;

@end
