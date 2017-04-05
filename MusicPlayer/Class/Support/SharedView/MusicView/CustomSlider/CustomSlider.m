//
//  CustomSlider.m
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/3/31.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import "CustomSlider.h"



@implementation CustomSlider


/*
- (void)getAllProperty:(Class )class {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(class, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        NSLog(@"Property Name : %@",name);
    }
}

- (void)getAllFunction:(Class )class{
    unsigned int count;
    Method *methods = class_copyMethodList(class, &count);
    for (int i = 0; i < count; i++){
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        const char *type =  method_getTypeEncoding(method);
        NSLog(@"Function Name: %@ Type: %s",name,type);
    }
}



- (void)Method{
    SEL centerSelector = NSSelectorFromString(@"createThumbView Type:");

    if ([self respondsToSelector:centerSelector]){
        NSMethodSignature *signature = [[UISlider class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        BOOL isCenter = NO;
        [invocation setArgument:&isCenter atIndex:2];
        [invocation invoke];
    }
}
*/
@end
