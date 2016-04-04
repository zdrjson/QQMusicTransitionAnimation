//
//  ViewController.m
//  QQMusicTransitionAnimation
//
//  Created by 张德荣 on 16/4/4.
//  Copyright © 2016年 JsonZhang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "TransitionFromSecondToFirst.h"
#import "TransitionFromFirstToSecond.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitionFromSecondToFirst alloc] init];
}

- (IBAction)presentSecond:(id)sender
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *sec = [story instantiateViewControllerWithIdentifier:@"secondStory"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:nil];
}

@end
