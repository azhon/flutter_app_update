//
//  UIAlertController+Dismiss.m
//  flutter_app_update
//
//  Created by 阿钟 on 2021/9/27.
//

#import "UIAlertController+Dismiss.h"
#import <objc/runtime.h>

@implementation UIAlertController (Dismiss)


@dynamic notDismiss;

- (void)setNotDismiss:(BOOL)notDissmiss {
    objc_setAssociatedObject(self, @selector(notDismiss), @(notDissmiss), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)notDismiss {
    return [(NSNumber *)objc_getAssociatedObject(self, _cmd) boolValue];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = NSSelectorFromString(@"_dismissAnimated:triggeringAction:triggeredByPopoverDimmingView:dismissCompletion:");
        SEL swizzledSelector = @selector(notDismissAnimated:
                                         triggeringAction:
                                         triggeredByPopoverDimmingView:
                                         dismissCompletion:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
//        动态添加方法，如果类中不存在这个方法的实现，则添加成功
//        这里 UIAlertController 类中存在 originalMethod，所以添加是失败的
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            // 如果添加成功，则用 originalMethod 替换添加的空方法 originalMethod
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            // 交换两个方法的实现
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)notDismissAnimated:(BOOL)animation
          triggeringAction:(UIAlertAction *)action
triggeredByPopoverDimmingView:(id)view
         dismissCompletion:(id)handler {
//    如果点击“取消”按钮或者允许弹框 dismiss，就调用原来的方法（originalMethod）
//      因为已经交换了两个方法的实现，所以其实是调用 swizzledMethod
//      所以这里并不会出现循环调用
//    否则就忽略原来的方法（originalMethod），直接下一步，掉用后面的方法
    if (action.style == UIAlertActionStyleCancel || self.notDismiss == NO) {
        [self notDismissAnimated:animation
                triggeringAction:action
   triggeredByPopoverDimmingView:view
               dismissCompletion:handler];
    } else {
        SEL invokeHandler = NSSelectorFromString(@"_invokeHandlersForAction:");
//        这里如果使用 performSelector 来调 invokeHandler 这个方法
//          [self performSelector:invokeHandler withObject:action];
//        会报 "PerformSelector may cause a leak because its selector is unknown" 的警告
//        为消除警告，用下面的方法
        IMP imp = [self methodForSelector:invokeHandler];
        void (*func)(id, SEL, UIAlertAction *) = (void *)imp;
        func(self, invokeHandler, action);
    }
}

@end
