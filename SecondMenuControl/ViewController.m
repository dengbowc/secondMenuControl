//
//  ViewController.m
//  SecondMenuViewControl
//
//  Created by 瑶波波 on 16/7/8.
//  Copyright © 2016年 dengbowc. All rights reserved.
//

#import "ViewController.h"
#import "SeconMenuControl.h"

@interface ViewController ()<SecontMenuProtocol>

@property (nonatomic ,strong) SeconMenuControl *secondMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    subView.backgroundColor = [UIColor redColor];
    SeconMenuControl *secondMenu = [[SeconMenuControl alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44) title:@"基金介绍" subView:subView];
    [self.view addSubview:secondMenu];
    secondMenu.clipsToBounds = YES;
    secondMenu.delegate = self;
    self.secondMenu = secondMenu;
}

- (void)secondMenuHeightChanged:(CGFloat)afterH beforeHeight:(CGFloat)beforeHeight {
    NSLog(@"%f",afterH);
    self.secondMenu.frame = CGRectMake(self.secondMenu.frame.origin.x, self.secondMenu.frame.origin.y, self.secondMenu.frame.size.width, afterH);
}


@end
