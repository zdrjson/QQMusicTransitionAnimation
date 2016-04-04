//
//  ViewController.m
//  QQMusicTransitionAnimation
//
//  Created by 张德荣 on 16/4/4.
//  Copyright © 2016年 JsonZhang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secondImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"taylorSwift.jpg"]];
    self.secondImageview.frame = CGRectMake(0, 0, 200, 200);
    self.secondImageview.center = self.view.center;
    self.secondImageview.layer.masksToBounds = YES;
    self.secondImageview.layer.cornerRadius = 100;
    self.secondImageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_secondImageview];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissFirst:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
