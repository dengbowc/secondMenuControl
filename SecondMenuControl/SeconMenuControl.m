//
//  SeconMenuControl.m
//  SecondMenuViewControl
//
//  Created by 瑶波波 on 16/7/8.
//  Copyright © 2016年 dengbowc. All rights reserved.
//

#define kMenuHeight 44

#import "SeconMenuControl.h"

// 菜单头部view
@interface MenuView : UIView

@property (nonatomic ,strong) UILabel *titlelabel;

@property (nonatomic ,strong) UIImageView *arrow;

@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor =  [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        titleLabel.text = @"我是标题";
        UIImageView *arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_up"]];
        arrow.center = CGPointMake(frame.size.width - 25, frame.size.height / 2);
        [self addSubview:titleLabel];
        [self addSubview:arrow];
        self.titlelabel = titleLabel;
        self.arrow = arrow;
    }
    return self;
}

@end

@interface SeconMenuControl()

// 是否展开
@property(nonatomic ,assign)  BOOL isExpend;

@property (nonatomic ,strong) MenuView *menuView;

@property (nonatomic ,strong) UIView *expendView;

@end

@implementation SeconMenuControl

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title subView:(UIView *)subView {
    if (self = [super initWithFrame:frame]) {
        self.isExpend = NO;
        MenuView *menu = [[MenuView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
        menu.titlelabel.text = title;
        subView.frame = CGRectMake(0, 44, frame.size.width, subView.frame.size.height);
        self.expendView = subView;
        [self addSubview:subView];
        [self addSubview:menu];
        self.menuView = menu;
        UIButton *btn = [[UIButton alloc]initWithFrame:menu.frame];
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(titleClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}


- (void)titleClick {
    self.isExpend = !self.isExpend;
    // 改变箭头的方向
    self.menuView.arrow.transform = CGAffineTransformRotate(self.menuView.arrow.transform, M_PI);
    if ([self.delegate respondsToSelector:@selector(secondMenuHeightChanged:beforeHeight:)]) {
        [self.delegate secondMenuHeightChanged:self.isExpend? 44 + self.expendView.frame.size.height : 44 beforeHeight:self.isExpend? 44 : 44 + self.expendView.frame.size.height];
    }
}


@end
