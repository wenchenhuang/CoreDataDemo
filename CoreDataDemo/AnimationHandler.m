//
//  AnimationHandler.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "AnimationHandler.h"
@implementation AnimationHandler
+(void)addShakeAnimationWithView:(UIView *)view{
  CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    NSInteger initalPositionX = view.layer.position.x;
    animation.values = @[@(initalPositionX),
                         @(initalPositionX + 10),
                         @(initalPositionX - 10),
                         @(initalPositionX + 10),
                         @(initalPositionX)];
    animation.keyTimes = @[
                           @(0),
                           @(1/6.0),
                           @(3/6.0),
                           @(5/6.0),
                           @(1)];
    [view.layer addAnimation:animation forKey:@"keyFrame"];
}
@end
