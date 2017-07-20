//
//  LDDAnimation.m
//  LDD-4
//
//  Created by 李洞洞 on 20/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDDAnimation.h"

#import "ViewController.h"
#import "SecController.h"

@interface LDDAnimation()
@property(nonatomic,assign)LDDAnimationType type;
@end

@implementation LDDAnimation
+ (instancetype)lddAnimation:(LDDAnimationType)type
{
    return [[self alloc]initWithAnimation:type];
}
- (instancetype)initWithAnimation:(LDDAnimationType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    switch (_type) {
        case LDDAnimationTypePresent:
        {
            [self doPresent:transitionContext];
        }
            break;
        case LDDAnimationTypeDismiss:
        {
            [self doDismiss:transitionContext];
        }
            break;
        default:
            break;
    }
}
- (void)doPresent:(id <UIViewControllerContextTransitioning>)transitionContext
{
    ViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * snipView = [fromVc.view snapshotViewAfterScreenUpdates:NO];
    snipView.frame = [fromVc.view convertRect:fromVc.view.bounds toView:containerView];
    
    CGRect toViewFinishF = [transitionContext finalFrameForViewController:toVc];
    toVc.view.frame = CGRectOffset(toViewFinishF, 0, [UIScreen mainScreen].bounds.size.height);
    fromVc.view.hidden = YES;
    [containerView addSubview:snipView];
    [containerView addSubview:toVc.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.45 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        
        toVc.view.transform = CGAffineTransformMakeTranslation(0, -400);
        snipView.transform = CGAffineTransformMakeScale(0.85, 0.85);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}
- (void)doDismiss:(id <UIViewControllerContextTransitioning>)transitionContext
{
    SecController * fromeVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * snipView = containerView.subviews.firstObject;
    
    //[containerView addSubview:toVc.view];
    //toVc.view.hidden = YES;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.45 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        
        fromeVc.view.transform = CGAffineTransformIdentity;
        snipView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        toVc.view.hidden = NO;
        [snipView removeFromSuperview];
        
    }];
    
    
}
@end
