//
//  UIControl+ClickWIthUser.m
//  埋点
//
//  Created by liurui on 2016/12/27.
//  Copyright © 2016年 liurui. All rights reserved.
//

#import "UIControl+ClickWIthUser.h"
#import "LRHookMagic.h"

@implementation UIControl (ClickWIthUser)
+(void)load
{
    static dispatch_once_t oncToken;
    dispatch_once(&oncToken, ^{
        
        SEL orignolClick = @selector(sendAction:to:forEvent:);
        SEL myClick = @selector(MYsendAction:to:forEvent:);
    [LRHookMagic swizzlingInClass:self originSelector:orignolClick swizzledSelector:myClick];
     });

}
-(void)MYsendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event
{
    [self userclickWithAction:action to:target forEvent:event];
    [self MYsendAction:action to:target forEvent:event];
}
-(void)userclickWithAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event
{
    
    NSLog(@"我头上有犄角。犄角___ACTION:%@\n___TARGET:%@___\n1EVENT:%@",NSStringFromSelector(action),target,event);
    
}


@end
