//
//  ViewController.m
//  QQMusicTransitionAnimation
//
//  Created by 张德荣 on 16/4/4.
//  Copyright © 2016年 JsonZhang. All rights reserved.
//

#import "TransitionFromSecondToFirst.h"

#import "ViewController.h"
#import "SecondViewController.h"

@implementation TransitionFromSecondToFirst

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *toViewController = (ViewController *)nav.topViewController;
    SecondViewController *fromViewController = (SecondViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    UIView *cellImageSnapshot = [fromViewController.secondImageview snapshotViewAfterScreenUpdates:YES];
    
    cellImageSnapshot.frame = [containerView convertRect:fromViewController.secondImageview.frame fromView:fromViewController.view];
    fromViewController.secondImageview.hidden = YES;
    
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:nav.view];
    [containerView addSubview:cellImageSnapshot];
    
  
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.alpha = 1.0;
        
        
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.containerView];
        
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        
        toViewController.imageView.hidden = NO;
        fromViewController.secondImageview.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}


@end
