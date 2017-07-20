//
//  ViewController.m
//  LDD-4
//
//  Created by 李洞洞 on 20/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ViewController.h"
#import "SecController.h"
#import "LDDAnimation.h"
@interface ViewController ()<SecControllerDelegate,UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)present:(UIButton *)sender {
    SecController * sec = [[SecController alloc]init];
    sec.modalPresentationStyle = UIModalPresentationCustom;
    sec.transitioningDelegate = self;
    sec.delegate = self;
    [self presentViewController:sec animated:YES completion:nil];
}

- (void)secControllerDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [LDDAnimation lddAnimation:LDDAnimationTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [LDDAnimation lddAnimation:LDDAnimationTypeDismiss];
}
@end
