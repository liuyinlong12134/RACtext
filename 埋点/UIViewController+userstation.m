//
//  UIViewController+userstation.m
//  埋点
//
//  Created by liurui on 2016/12/27.
//  Copyright © 2016年 liurui. All rights reserved.
//

#import "UIViewController+userstation.h"
#import "LRHookMagic.h"

@implementation UIViewController (userstation)
+(void)load
{
    static dispatch_once_t oncToken;
    dispatch_once(&oncToken, ^{
        SEL origSelect = @selector(viewWillAppear:);
        SEL swizzselect = @selector(swiz_viewWillAppear:);
        [LRHookMagic swizzlingInClass:[self class] originSelector:origSelect swizzledSelector:swizzselect];
        SEL origSelect1 = @selector(viewWillDisappear:);
        SEL swizzselect1 = @selector(swiz_viewWillDisappear:);
        [LRHookMagic swizzlingInClass:[self class] originSelector:origSelect1 swizzledSelector:swizzselect1];
    });
}
-(void)swiz_viewWillAppear:(BOOL)animated
{
    [self live_viewWillappear];
    [self swiz_viewWillAppear:YES];
}
-(void)swiz_viewWillDisappear:(BOOL)animated
{
    
    
    [self leave_viewWilldisappear];
    [self swiz_viewWillDisappear:YES];
}
-(void)live_viewWillappear
{
    NSLog(@"%@进入",[self class]);
}
-(void)leave_viewWilldisappear
{
    NSLog(@"%@离开",[self class]);
}
@end
