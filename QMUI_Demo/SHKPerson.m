//
//  SHKPerson.m
//  QMUI_Demo
//
//  Created by Cer on 2019/12/9.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "SHKPerson.h"
#import "SHKForwarder.h"
#import <objc/runtime.h>

@implementation SHKPerson


+(void)test
{
   id test  =  object_getClass(self);
    
    BOOL isMeta =   class_isMetaClass(test);
    NSLog(@"test:%@\nisMeta:%d",test,isMeta);
}

//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(test)) {
//        return [[SHKForwarder alloc] init];
//    }
//    return  [super forwardingTargetForSelector:aSelector];
//}

//- (void)test
//{
//    NSLog(@"----");
//}


//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//
//}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    if (sel == @selector(test)) {
//        Method method  =  class_getInstanceMethod(self, @selector(other_method));
//       class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//
//- (void)other_method
//{
//    NSLog(@"%s",_cmd);
//}


//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(test)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    [anInvocation invokeWithTarget:[[SHKForwarder alloc] init]];
//}
@end
